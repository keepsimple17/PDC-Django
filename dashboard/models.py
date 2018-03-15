from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import RegexValidator
import os

POLITICAL_PARTY_CHOICES = (
    ('decratic', 'Democratic'),
    ('republic', 'Republic'),
    ('beer', 'Beer'),
)

#Political Spectrum is the ideological posture of the Political Party (ex. democrats or republicans | left wing or right wing)
PoliticalSpectrum = (
    ('Centro', 'Centro'),
    ('CentroDireita','Centro Direita'),
    ('CentroEsquerda', 'Centro Esquerda'),
    ('Esquerda', 'Esquerda'),
    ('ExtremaDireita', 'Extrema Direita'),
    ('ExtremaEsquerda', 'Extrema Esquerda'),
)

#Regions In Brazil (used to define the State location (and Citie location)
Regioes = (
    (1, 'Norte'),
    (2, 'Nordeste'),
    (3, 'Sudeste'),
    (4,'Sul'),
    (5, 'Centro-Oeste')
)

# Manager for the Federal States in Brazil
class EstadoManager(models.Manager):
    def search(self,query):
        return self.get_queryset().filter(
            models.Q(Nome__icontains=query) | models.Q(Uf__icontains=query)
        )

# This is the Manager for the Cities (Conties) in Brazil
class MunicipioManager(models.Manager):
    def search(self,query):
        return self.get_queryset().filter(
            models.Q(Nome__icontains=query) | models.Q(Uf__icontains=query)
        )

# This is the Manager for the Candidate Political Party
class PoliticalPartiesManager(models.Manager):
    def search(self,query):
        return self.get_queryset().filter(
            models.Q(electoral_number__icontains=query) | models.Q(sigla__icontains=query)
        )


# Political Partie list
class PoliticalParties(models.Model):
    id_partido = models.IntegerField("Numero Partido",primary_key=True, unique=True)
    sigla = models.CharField('Sigla', max_length=6) # party symbol
    name = models.CharField('Nome do Partido', max_length=70) # party complete name
    electoral_number = models.CharField("Número Eleitoral", max_length=3) #the number that indicate the Political Party
    affiliates_number = models.IntegerField("Número de Filiados")
    president_name = models.CharField("Presidente Atual", max_length=60) #The present political leader of the Political Party
    political_spectrum = models.CharField(max_length=100, choices=PoliticalSpectrum, blank=True, null=True)
    image_flag = models.ImageField(
        upload_to='images/political_flags', verbose_name='bandeiraPartido', null=True, blank=True
    )
    objects = PoliticalPartiesManager()


# Table of Federal States in Brazil
class Estado (models.Model):
    Id = models.IntegerField(primary_key=True,unique=True)
    CodigoUf = models.PositiveSmallIntegerField(unique=True)
    Nome=models.CharField(max_length=50)
    Uf=models.CharField(max_length=2,unique=True)
    Regiao=models.PositiveSmallIntegerField(blank=False)
    objects = EstadoManager


# This is the conties database. All cities in Brasil
class Municipio(models.Model):
    Id = models.IntegerField(primary_key=True, unique=True)
    Codigo = models.IntegerField(null=False, unique=True) # unique Federal Code to the Region
    Nome = models.CharField(max_length=255)
    Uf = models.CharField(max_length=2)
    objects=MunicipioManager()

# This is the Neiborhood locations, for the address forms and data location
class Bairro(models.Model):
    Id = models.IntegerField(primary_key=True,unique=True)
    Codigo = models.CharField(max_length=10, unique=True)
    Nome = models.CharField(max_length=255,null=False)
    Uf = models.CharField(max_length=2)


class Profile(models.Model):
    # This will represent an user account profile entity
    user = models.OneToOneField(User, null=False, blank=False)
    location = models.CharField(max_length=50, blank=True, null=True)
    political_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    phone = models.CharField(blank=True, null=True, max_length=15,
                             validators=[RegexValidator(regex='^\+?1?\d{9,15}$',
                                                        message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.",
                                                        code='Invalid number')])
    created_date = models.DateField(auto_now=True, null=True, blank=True)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()