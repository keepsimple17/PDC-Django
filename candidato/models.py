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
    (3, 'Sudeste'),     # southeast
    (4, 'Sul'),  # south
    (5, 'Centro-Oeste')     # Midwest
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

ELECTION_BALLOTS = (
    ('2018', 'Eleições 2018'),
    ('2020', 'Eleições 2020'),
)


class Candidate(models.Model):
    user = models.OneToOneField(User, null=True, blank=False)
    reference_id = models.IntegerField
    # to associate to the user who invited the candidate
    user_id = models.IntegerField
    # the User ID of Candidate in the system | dashboard.profile
    candidate_political_nickname = models.CharField("Nome Eleitoral do Candidato", max_length=40, blank=True, null=True)
    candidate_dispute_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    # todo to get the positions depending of the ballot year
    # The year and ballot of electoral dispute
    canditate_Election_Ballot = models.CharField("Pleito de Disputa Eleitoral", max_length=30,
                                                 choices=ELECTION_BALLOTS, blank=True, null=True)
    # The desired position at Ballot
    campaign_desired_position = models.CharField("Cargo de Disputa", max_length=30, blank=True, null=True)
    # todo depending od the desired position, state campaign or city campaign are not necessary
    # State of the electoral campaign
    state_campaign = models.CharField("UF de Campanha", max_length=2, blank=True, null=True)
    # City of the electoral campaign
    city_campaign = models.CharField("Cidade de Campanha", max_length=255, blank=True, null=True)
    # todo the number should sugest to begins with the dispute_party number
    # The number of candidate in electoral dispute
    candidate_dispute_number = models.CharField("Número do Candidato", max_length=6, blank=True, null=True)
    # candidate' Slug used to create map url
    slug = models.SlugField('Atalho', blank=True)

    holds_political_position = models.BooleanField("Detém Cargo Político", default="False")
    # todo If the candidate does not holds political position, disable political position
    political_position = models.CharField("Posição Politica que Exerce", max_length=40, null=True, blank=True)
    reelection = models.BooleanField("Tentando Reeleição", default="False")
    first_political_campaign = models.BooleanField("Detém Cargo Político", default="False")

    # Candidate web site
    candidate_site = models.CharField("Site do Candidate", max_length=50, blank=True, null=True)
    # Campaign Email (if diferent from the candidate email)
    campaign_email = models.EmailField("Email do Candidato", null=True, blank=True)
    facebook = models.CharField(max_length=40, blank=True, null=True)
    twitter = models.CharField(max_length=40, blank=True, null=True)
    google = models.CharField(max_length=40, blank=True, null=True)
    youtube = models.CharField(max_length=40, blank=True, null=True)
    instagram = models.CharField(max_length=40, blank=True, null=True)
    usuarioes = models.ManyToManyField('dashboard.usuario', blank=True)

    foto = models.ImageField(
        # if diferent from the user photo in the dashboard.profile
        upload_to='images/Candidatos', verbose_name='FotoCandidato', null=True, blank=True
    )

    # Field to put Candidate's Resume
    Resume = models.TextField("Currículo", blank=True, null=True)
    # Field to put observations about Candidate
    Obs = models.TextField("Observação", blank=True, null=True)

    candidate_situation = models.CharField("Situation", max_length=40,
                                           choices=CANDIDATE_STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(
        'Criado em', auto_now_add=True
    )
    updated_at = models.DateTimeField('Atualizado em', auto_now_add=True)

# user = models.OneToOneField(User, null=False, blank=False)


# this is used to list the candidacy coalitions
class Coalitions(models.Model):
    # the User ID of Candidate in the system | dashboard.profile
    Id_Candidate = models.IntegerField
    name_coligation = models.CharField("Nome Coligação", max_length=60, null=True, blank=True)
    # associated with the Political Partie Number
    political_partie_number = models.IntegerField
    political_partie_abbreviation = models.CharField("Sigla Partirária", max_length=20, null=True, blank=True)


# Group of Users from Candidate' Confidence, with
class Staff(models.Model):
    pass


# Election Committee
class Committees(models.Model):
    # the Candidate who owns the Commitee
    id_candidate = models.IntegerField
    # the staff user responsible in Commitee
    id_responsible = models.IntegerField
    # The Brazilian zipCode
    cep = models.CharField("CEP", max_length=9, blank=True, null=True)
    # Federal State (in dashboard_estado table)
    estado = models.CharField("UF", max_length=2, blank=True, null=True)
    # city
    cidade = models.CharField("Cidade", max_length=255, blank=True, null=True)
    # neiborhood
    bairro = models.CharField("Bairro", max_length=255, blank=True, null=True)
    address = models.CharField("Endereço", max_length=255, blank=True, null=True)
    cellPhone = models.CharField(blank=True, null=True, max_length=15,
                                 validators=[RegexValidator(regex='^\+?1?\d{9,15}$',
                                                            message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.",
                                                            code='Invalid number')])
    landlinePhone = models.CharField("Telefone Fixo", max_length=11, blank=True, null=True)


class Committee_Members(models.Model):
    # the Commitee id
    id_commitee = models.IntegerField
    # the user ID of the User in commitee (dashboard.models.Profile)
    id_user = models.IntegerField
    # User assignments in Commitee
    assignments = models.CharField("Atribuições", max_length=255, null=True, blank=True)
    observations = models.TextField('Observações', null=True, blank=True)


# This define the roles of user in the candidate environment
# come from pre-defined roles list. Can be persolized by the Candidate'
# The Budget managment in this class is to the Candidate Cashback. Users will have their own cashback control
class UserRoles(models.Model):
    # candidate_id = models.IntegerField
    candidate = models.ForeignKey(Candidate, blank=True, null=True, related_name='candidate_in_user_roles')
    # user_ir = models.IntegerField
    user = models.ForeignKey('dashboard.Usuario', blank=True, null=True, related_name='usuario_in_user_roles')
    role_name = models.CharField('Regras das Funções', max_length=40, default="Geral")
    budget_managment = models.PositiveSmallIntegerField('Controle Financeiro', default=0)
    members_managment = models.PositiveSmallIntegerField('Gestão de Usuários', default=4)
    reports_managment = models.PositiveSmallIntegerField('Gestão de Relatórios', default=2)
    members_access = models.PositiveSmallIntegerField('Acesso a Membros', default=4)
    agenda_access = models.PositiveSmallIntegerField('Acesso à Agenda', default=6)
    # users Interaction
    internetInteraction = models.PositiveSmallIntegerField('interação com outros membros', default=7)
    sendMessages = models.PositiveSmallIntegerField('Enviar Mensagens', default=6)


# Predefined list of user possibilites to the UserRoles table
class UserRoles_list(models.Model):
    role_name = models.CharField('Função do Usuário', max_length=40, blank=False)
    budget_managment = models.PositiveSmallIntegerField('Controle Financeiro', default=0)
    members_managment = models.PositiveSmallIntegerField('Gestão de Usuários', default=4)
    reports_managment = models.PositiveSmallIntegerField('Gestão de Relatórios', default=2)
    members_access = models.PositiveSmallIntegerField('Acesso a Membros', default=4)
    agenda_access = models.PositiveSmallIntegerField('Acesso à Agenda', default=6)
    internetInteraction = models.PositiveSmallIntegerField('interação com outros membros',
                                                           default=7)  # users Interaction
    sendMessages = models.PositiveSmallIntegerField('Enviar Mensagens', default=6)
