from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import RegexValidator
from django_extensions.db.models import (
    TitleSlugDescriptionModel, TimeStampedModel)

import os

POLITICAL_PARTY_CHOICES = (
    ('pmdb', 'PMDB'),
    ('pt', 'PT'),
    ('psdb', 'PSDB'),
    ('pp', 'PP'),
    ('pdt', 'PDT'),
    ('dem', 'DEMOCRATAS'),
    ('pr', 'PR'),
    ('psb', 'PSB'),
    ('pps', 'PPS'),
    ('pcdob', 'PCdoB'),
    ('prb', 'PRB'),
    ('pv', 'PV'),
    ('psd', 'PSD'),
    ('prp', 'PRP'),
    ('psl', 'PSL'),
    ('pmn', 'PMN'),
    ('phs', 'PHS'),
    ('ptc', 'PTC'),
    ('sd', 'SOLIDARIEDADE'),
    ('psdC', 'PSDC'),
    ('avante', 'AVANTE'),
    ('podemos', 'PODE'),
    ('psol', 'PSOL'),
)

# Political Spectrum is the ideological posture of the Political Party
# (ex. democrats or republicans | left wing or right wing)
PoliticalSpectrum = (
    ('Centro', 'Centro'),
    ('CentroDireita', 'Centro Direita'),
    ('CentroEsquerda', 'Centro Esquerda'),
    ('Esquerda', 'Esquerda'),
    ('ExtremaDireita', 'Extrema Direita'),
    ('ExtremaEsquerda', 'Extrema Esquerda'),
)

# Regions In Brazil (used to define the State location (and Citie location)
Regioes = (
    (1, 'Norte'),   # north
    (2, 'Nordeste'),    # northeast
    (3, 'Sudeste'),    # southeast
    (4, 'Sul'),  # south
    (5, 'Centro-Oeste'),    # Midwest
)


# Manager for the Federal States in Brazil
class EstadoManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(Nome__icontains=query) | models.Q(Uf__icontains=query)
        )


# This is the Manager for the Cities (Conties) in Brazil
class MunicipioManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(Nome__icontains=query) | models.Q(Uf__icontains=query)
        )


# This is the Manager for the Candidate Political Party
class PoliticalPartiesManager(models.Manager):
    def search(self, query):
        return self.get_queryset().filter(
            models.Q(electoral_number__icontains=query) | models.Q(sigla__icontains=query)
        )


# Political Partie list
class PoliticalParties(models.Model):
    # id_partido = models.IntegerField("Numero Partido",primary_key=True, unique=True)
    sigla = models.CharField('Sigla', max_length=6)    # party symbol
    name = models.CharField('Nome do Partido', max_length=70)   # party complete name
    # the number that indicate the Political Party
    electoral_number = models.CharField("Número Eleitoral", max_length=3)
    affiliates_number = models.IntegerField("Número de Filiados")
    # The present political leader of the Political Party
    president_name = models.CharField("Presidente Atual", max_length=60)
    political_spectrum = models.CharField(max_length=100, choices=PoliticalSpectrum, blank=True, null=True)
    image_flag = models.ImageField(
        upload_to='images/political_flags', verbose_name='bandeiraPartido', null=True, blank=True
    )
    objects = PoliticalPartiesManager()


# Table of Federal States in Brazil
class Estado (models.Model):
    # id = models.IntegerField("Numero Partido", primary_key=True, unique=True)
    CodigoUf = models.PositiveSmallIntegerField(primary_key=True, unique=True)
    Nome = models.CharField(max_length=50)
    Uf = models.CharField(max_length=2)
    Regiao = models.PositiveSmallIntegerField(blank=False)
    objects = EstadoManager


# This is the conties database. All cities in Brasil
class Municipio(models.Model):
    # Id = models.IntegerField(primary_key=True, unique=True)
    Codigo = models.IntegerField(null=False, unique=True)   # unique Federal Code to the Region
    Nome = models.CharField(max_length=255)
    Uf = models.CharField(max_length=2)
    objects = MunicipioManager()


# This is the Neiborhood locations, for the address forms and data location
class Bairro(models.Model):
    # Id = models.IntegerField(primary_key=True,unique=True)
    Codigo = models.CharField(max_length=10, unique=True)
    Nome = models.CharField(max_length=255, null=False)
    Uf = models.CharField(max_length=2)


class relationship_network(models.Model):
    id_actor_a = models.IntegerField()  # index from the first actor
    kind_of_relationship = models.CharField("Tipo de Relacionamento", max_length=40, blank=True, null=True)
    id_actor_b = models.IntegerField()  # index from the second actor
    secondary_actor = models.IntegerField()
    kind_of_relationship_to_secondary = models.CharField("Tipo de Relacionamento", max_length=40, blank=True, null=True)
    observations = models.TextField(null=True, blank=True)


# This will represent an user account profile entity (will substitute the Profile Model bellow)
class Usuario(models.Model):

    GENDER_CHOICES = (
        ('M', 'Masculino'),
        ('F', 'Feminino'),
    )

    # Marital Status
    ESTADO_CIVIL_CHOICES = (
        ('S', 'Solteiro'),
        ('C', 'Casado'),
        ('D', 'Divorciado'),
        ('V', 'Viúvo'),
        ('O', 'Outro'),
    )

    # status of the Candidate Aproval to the dashboard
    USER_STATUS_CHOICES = (
        ('aproved', 'Aprovado'),
        ('denied ', 'Não Aprovado'),
        ('pending', 'Aguardando Aprovação'),
    )

    # Kind of activity or function of the user to the candidate or campaign
    USER_ROLES_CHOICES = (
        ('subscriber', 'Assinante'),
        ('agency', 'Agência de Marketing'),
        ('consultor', 'Consultor de Campanha'),
        ('external_contractor', 'Contratado Externo'),
        ('internal_employee', 'Empregado Interno'),
        ('outsourced', 'Terceirizado'),
        ('voluntary', 'Voluntário'),
    )

    user = models.OneToOneField(User, null=False, blank=False)
    gender = models.CharField('Gênero', max_length=1, choices=GENDER_CHOICES, null=True)
    marital_status = models.CharField("Estado Civil", max_length=1, choices=ESTADO_CIVIL_CHOICES,null=True)
    cpf = models.CharField('CPF', max_length=11, unique=True, null=True, blank=True)    # Document ID in Brazil
    birthday_date = models.DateField('Data de Nascimento',null=True,blank=True)
    # todo to implement autofill address - https://github.com/staticdev/django-cep
    cep = models.CharField("CEP", max_length=9, blank=True, null=True)  # The Brazilian zipCode
    estado = models.CharField("UF", max_length=2, blank=True, null=True)    # Federal State (in dashboard_estado table)
    cidade = models.CharField("Cidade", max_length=255, blank=True, null=True)  # city
    bairro = models.CharField("Bairro", max_length=255, blank=True, null=True)  # neiborhood
    address = models.CharField("Endereço", max_length=255, blank=True, null=True)
    cellPhone = models.CharField(blank=True, null=True, max_length=15,
                                 validators=[RegexValidator(regex='^\+?1?\d{9,15}$',
                                                            message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.",
                                                            code='Invalid number')])
    landlinePhone = models.CharField("Telefone Fixo", max_length=11, blank=True, null=True)
    email_verified = models.NullBooleanField(null=True)
    cellPhone_verified = models.BooleanField
    user_political_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    user_profile_photo = models.ImageField(
        upload_to='images/users', verbose_name='foto', null=True, blank=True
    )
    created_date = models.DateField(auto_now=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    # data related to the Candidate the User will indicate | that could exist in system
    # id of candidate the User indicated - will be filled latter. Hidden
    id_candidate = models.IntegerField("Id candidato", blank=True, null=True)
    candidate_political_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    candidate_name = models.CharField("Nome do Candidato", max_length=100, blank=True, null=True)
    # State where the candidate is running for elections
    candidate_estado = models.CharField("UF do Candidato", max_length=2, blank=True, null=True)
    candidate_city = models.CharField("Cidade do Candidato", max_length=255, blank=True, null=True)
    # verify if candidate exists in candidate table
    candidate_email = models.EmailField("Email do Candidato", null=True)

    # Information of the access rights and roles of User to the candidate

    user_status = models.CharField("Status", max_length=40, choices=USER_STATUS_CHOICES)
    user_role = models.CharField("Tipo de Acesso", max_length=40, choices=USER_ROLES_CHOICES)

    def __str__(self):              # __unicode__ on Python 2
        return self.user.first_name+self.user.last_name


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Usuario.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.usuario.save()


"""
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
"""