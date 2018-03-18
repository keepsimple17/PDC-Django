from __future__ import unicode_literals
from django.db import models

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import RegexValidator
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
    ('podemos','PODE'),
    ('psol','PSOL'),
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
    (1, 'Norte'), #north
    (2, 'Nordeste'), #northeast
    (3, 'Sudeste'), #southeast
    (4,'Sul'), #south
    (5, 'Centro-Oeste') #Midwest
)

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

CANDIDATE_STATUS_CHOICES = (
    ('aproved', 'Aprovado'),
    ('denied ', 'Não Aprovado'),
    ('pending', 'Aguardando Aprovação'),
)

ELECTION_BALLOTS =(
    ('2018', 'Eleições 2018'),
    ('2020', 'Eleições 2020'),
)



class Candidate(models.Model):
    reference_id = models.IntegerField #to associate to the user who invited the candidate
    user_id = models.IntegerField #the User ID of Candidate in the system | dashboard.profile
    candidate_political_nickname = models.CharField("Nome Eleitoral do Candidato", max_length=40, blank=True, null=True)
    candidate_dispute_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
        #todo to get the positions depending of the ballot year
    canditate_Election_Ballot = models.CharField("Pleito de Disputa Eleitoral",max_length=30,choices=ELECTION_BALLOTS, blank=True,null=True) #The year and ballot of electoral dispute
    campaign_desired_position = models.CharField("Cargo de Disputa", max_length=30, blank=True, null=True) #The desired position at Ballot
        #todo depending od the desired position, state campaign or city campaign are not necessary
    state_campaign = models.CharField("UF de Campanha", max_length=2, blank=True, null=True) # State of the electoral campaign
    city_campaign = models.CharField("Cidade de Campanha", max_length=255, blank=True, null=True)  # City of the electoral campaign
        #todo the number should sugest to begins with the dispute_party number
    candidate_dispute_number = models.CharField("Número do Candidato", max_length=6, blank=True, null=True) # The number of candidate in electoral dispute
        #candidate' Slug used to create map url
    slug = models.SlugField('Atalho', blank=True)


    holds_political_position = models.BooleanField("Detém Cargo Político", default="False")
        #todo If the candidate does not holds political position, disable political position
    political_position = models.CharField("Posição Politica que Exerce", max_length=40,null=True,blank=True)
    reelection = models.BooleanField("Tentando Reeleição", default="False")
    first_political_campaign = models.BooleanField("Detém Cargo Político", default="False")


    candidate_site = models.CharField("Site do Candidate", max_length=50, blank=True, null=True) #Candidate web site
    campaign_email = models.EmailField("Email do Candidato", null=True, blank=True)  # Campaign Email (if diferent from the candidate email)
    facebook = models.CharField(max_length=40, blank=True, null=True)
    twitter = models.CharField(max_length=40, blank=True, null=True)
    google = models.CharField(max_length=40, blank=True, null=True)
    youtube = models.CharField(max_length=40, blank=True, null=True)
    instagram = models.CharField(max_length=40, blank=True, null=True)


    foto = models.ImageField(
        #if diferent from the user photo in the dashboard.profile
        upload_to='images/Candidatos', verbose_name='FotoCandidato', null=True, blank=True
    )

        # Field to put Candidate's Resume
    Resume = models.TextField("Currículo", blank=True, null=True)
        #Field to put observations about Candidate
    Obs = models.TextField("Observação", blank=True, null=True)


    candidate_situation =  models.CharField("Situation", max_length=40,
                                            choices=CANDIDATE_STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(
        'Criado em', auto_now_add=True
    )
    updated_at = models.DateTimeField('Atualizado em', auto_now_add=True)

#user = models.OneToOneField(User, null=False, blank=False)



