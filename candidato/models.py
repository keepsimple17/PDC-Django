from __future__ import unicode_literals

import os

from core.utils.model_utils import phone_validators
from django.contrib.auth.models import User
from django.core.validators import RegexValidator
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

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

CANDIDATE_POSITION_CHOICES = (
    ('pr', 'Presidente'),
    ('se', 'Senador'),
    ('df', 'Deputado Federal'),
    ('go', 'Governador'),
    ('pr', 'Prefeito'),
    ('ds', 'Deptado Estadual'),
    ('ve', 'Vereador'),
)

CANDIDATE_CURRENT_POSITION = (('na', 'Nenhum'), ('pt', 'Partidario Criminoso'),) + CANDIDATE_POSITION_CHOICES

CANDIDATE_INVITE_CHOICES = (
    ('S', 'SUSPENSO'),
    ('I', 'INATIVO'),
    ('C', 'CONVIDADO'),
    ('A', 'ATIVO'),
)


class Candidate(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    reference_id = models.IntegerField
    # to associate to the user who invited the candidate
    # let's rethink about this field, if needed, it should be n:n relationship.
    # user_id = models.IntegerField
    # the User ID of Candidate in the system | dashboard.profile
    candidate_political_nickname = models.CharField("Nome Eleitoral do Candidato", max_length=40, blank=True, null=True)
    # candidate_dispute_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    candidate_dispute_party = models.ForeignKey(
        'dashboard.PoliticalParties', blank=True, null=True, verbose_name=u'Candidate Dispute Party',
        on_delete=models.CASCADE)
    candidate_party = models.CharField(max_length=50, blank=True, null=True)
    # todo to get the positions depending of the ballot year
    # The year and ballot of electoral dispute
    canditate_Election_Ballot = models.CharField(
        "Pleito de Disputa Eleitoral", max_length=30, choices=ELECTION_BALLOTS, blank=True, null=True)
    # The desired position at Ballot
    # need to remove

    # Experience - Previous experience of the candidate
    # political or not
    experience = models.CharField(max_length=255, null=True, blank=True)

    campaign_desired_position = models.ForeignKey(
        'elections.Position', blank=True, null=True, related_name='position_in_campaign_desired_position',
        verbose_name=u'Cargo de Disputa', on_delete=models.CASCADE)
    # campaign_desired_position = models.CharField("Cargo de Disputa", max_length=30, blank=True, null=True)
    # candidate_desired_position = models.CharField(
    #     'Cargo Pretendido pelo Candidato', max_length=30, blank=True, null=True)
    # candidate_current_position = models.CharField(
    #     'Cargo Pretendido pelo Candidato', max_length=30, blank=True, null=True)

    # todo depending od the desired position, state campaign or city campaign are not necessary
    # State of the electoral campaign
    state_campaign = models.CharField("UF de Campanha", max_length=2, blank=True, null=True)
    candidate_state = models.CharField("UF", max_length=2, blank=True, null=True)
    candidate_city = models.CharField("Cidade", max_length=255, blank=True, null=True)
    # need to remove
    # holds_position = models.CharField("Exerce Cargo", max_length=255, blank=True, null=True)
    # holds_political_position = models.CharField("Detém Cargo Político", max_length=4, blank=True, null=True)
    # first_political_campaign = models.BooleanField("Detém Cargo Político", default="False")

    # City of the electoral campaign
    city_campaign = models.CharField("Cidade de Campanha", max_length=255, blank=True, null=True)
    # todo the number should sugest to begins with the dispute_party number
    # The number of candidate in electoral dispute
    candidate_dispute_number = models.CharField("Número do Candidato", max_length=6, blank=True, null=True)
    # candidate' Slug used to create map url
    slug = models.SlugField('Atalho', blank=True)

    # todo If the candidate does not holds political position, disable political position
    # political_position = models.CharField("Posição Politica que Exerce", max_length=40, null=True, blank=True)
    political_position = models.ForeignKey(
        'elections.Position', null=True, blank=True, related_name='position_in_political_position',
        verbose_name=u'Posição Politica que Exerce', on_delete=models.CASCADE)

    # reelection = models.CharField("Tentando Reeleição", max_length=40, null=True, blank=True)
    # first_political_campaign = models.CharField("Primeira Eleição", max_length=40, null=True, blank=True)

    reelection = models.BooleanField("Tentando Reeleição", blank=True, default=False)
    first_political_campaign = models.BooleanField("Primeira Eleição", blank=True, default=False)

    # Candidate web site
    candidate_site = models.CharField("Site do Candidate", max_length=50, blank=True, null=True)
    # Campaign Email (if diferent from the candidate email)
    campaign_email = models.EmailField("Email do Candidato", null=True, blank=True)
    facebook = models.CharField(max_length=40, blank=True, null=True)
    facebook_img = models.TextField(blank=True, null=True)
    facebook_url = models.URLField(blank=True, null=True)
    twitter = models.CharField(max_length=40, blank=True, null=True)
    twitter_img = models.TextField(blank=True, null=True)
    twitter_url = models.URLField(blank=True, null=True)
    googlep = models.CharField(max_length=40, blank=True, null=True)
    googlep_img = models.TextField(blank=True, null=True)
    googlep_url = models.URLField(blank=True, null=True)
    youtube = models.CharField(max_length=40, blank=True, null=True)
    youtube_img = models.TextField(blank=True, null=True)
    youtube_url = models.URLField(blank=True, null=True)
    instagram = models.CharField(max_length=40, blank=True, null=True)
    instagram_img = models.TextField(blank=True, null=True)
    instagram_url = models.URLField(blank=True, null=True)
    candidate_blog_rss = models.CharField(max_length=40, blank=True, null=True)
    candidate_blog_rss_img = models.TextField(blank=True, null=True)
    candidate_blog_rss_url = models.URLField(blank=True, null=True)
    # usuarioes = models.ManyToManyField('dashboard.Usuario', blank=True)
    proposals = models.ManyToManyField('candidato.Proposal', blank=True)
    rejection_rate = models.FloatField(default=0.0)
    intention_rate = models.FloatField(default=0.0)

    foto = models.ImageField(
        # if diferent from the user photo in the dashboard.profile
        upload_to='images/Candidatos', verbose_name=u'FotoCandidato', null=True, blank=True
    )

    # Field to put Candidate's Resume
    resume = models.FileField(upload_to='files/candidatos', verbose_name=u"Currículo", blank=True, null=True)
    # Field to put observations about Candidate
    obs = models.TextField("Observação", blank=True, null=True)

    candidate_situation = models.CharField(
        "Situation", max_length=40, choices=CANDIDATE_STATUS_CHOICES, default='pending')
    positive_keywords = models.ManyToManyField('candidato.Keyword', blank=True, related_name='p_keyword_in_candidato')
    negative_keywords = models.ManyToManyField('candidato.Keyword', blank=True, related_name='n_keyword_in_candidato')
    created_at = models.DateTimeField('Criado em', auto_now_add=True)
    updated_at = models.DateTimeField('Atualizado em', auto_now_add=True)

    def __str__(self):
        if self.user:
            return self.user.username
        else:
            return str(self.id)

    def __unicode__(self):
        if self.user:
            return self.user.username
        else:
            return str(self.id)


# this is used to list the candidacy coalitions
class Coalitions(models.Model):
    # the User ID of Candidate in the system | dashboard.profile
    Id_Candidate = models.IntegerField
    name_coligation = models.CharField("Nome Coligação", max_length=60, null=True, blank=True)
    # associated with the Political Partie Number
    political_partie_number = models.IntegerField
    political_partie_abbreviation = models.CharField("Sigla Partirária", max_length=20, null=True, blank=True)

    def __str__(self):
        return self.name_coligation


# Group of Users from Candidate' Confidence, with
class Staff(models.Model):
    pass


# Election Committee
class Committees(models.Model):
    name = models.TextField(blank=True, null=True)
    # the Candidate who owns the Commitee
    candidate = models.ForeignKey('candidato.Candidate', blank=True, null=True, on_delete=models.CASCADE)
    # the staff user responsible in Commitee
    responsible = models.ForeignKey('dashboard.Usuario', blank=True, null=True, on_delete=models.CASCADE)
    responsible_tmp = models.ForeignKey('candidato.TempUser', blank=True, null=True, on_delete=models.CASCADE)
    # The Brazilian zipCode
    cep = models.CharField("CEP", max_length=17, blank=True, null=True)
    # Federal State (in dashboard_estado table)
    estado = models.CharField("UF", max_length=17, blank=True, null=True)
    # city
    cidade = models.CharField("Cidade", max_length=255, blank=True, null=True)
    # neighbourhood
    bairro = models.CharField("Bairro", max_length=255, blank=True, null=True)
    address = models.CharField("Endereço", max_length=255, blank=True, null=True)
    cell_phone = models.CharField(blank=True, null=True, max_length=17, validators=[phone_validators])
    landline_phone = models.CharField(
        "Telefone Fixo", max_length=17, blank=True, null=True, validators=[phone_validators])
    members = models.ManyToManyField(
        'candidato.CommitteeMembers', blank=True, related_name='committee_members_in_committee')

    def __str__(self):
        return self.name


class CommitteeMembers(models.Model):
    # the Commitee id
    commitee = models.ForeignKey('candidato.Committees', blank=True, null=True, on_delete=models.CASCADE)
    # the user ID of the User in commitee (dashboard.models.Profile)
    usuario = models.ForeignKey('dashboard.Usuario', blank=True, null=True, on_delete=models.CASCADE)
    # User assignments in Committee
    assignments = models.CharField("Atribuições", max_length=255, null=True, blank=True)
    observations = models.TextField('Observações', null=True, blank=True)

    def __str__(self):
        return self.usuario.user.username


# This define the roles of user in the candidate environment
# come from pre-defined roles list. Can be persolized by the Candidate'
# The Budget managment in this class is to the Candidate Cashback. Users will have their own cashback control
class UserRoles(models.Model):
    # candidate_id = models.IntegerField
    candidate = models.ForeignKey(
        Candidate, blank=True, null=True, related_name='candidate_in_user_roles', on_delete=models.CASCADE)
    # user_ir = models.IntegerField
    user = models.ForeignKey(
        'dashboard.Usuario', blank=True, null=True, related_name='usuario_in_user_roles', on_delete=models.CASCADE)
    invite = models.ForeignKey(
        'candidato.Invites', blank=True, null=True, related_name='usuario_in_user_roles', on_delete=models.CASCADE)
    role_name = models.CharField('Regras das Funções', max_length=40, default="Geral")
    budget_managment = models.PositiveSmallIntegerField('Controle Financeiro', default=0)
    members_managment = models.PositiveSmallIntegerField('Gestão de Usuários', default=4)
    reports_managment = models.PositiveSmallIntegerField('Gestão de Relatórios', default=2)
    members_access = models.PositiveSmallIntegerField('Acesso a Membros', default=4)
    agenda_access = models.PositiveSmallIntegerField('Acesso à Agenda', default=6)
    # users Interaction
    internetInteraction = models.PositiveSmallIntegerField('interação com outros membros', default=7)
    sendMessages = models.PositiveSmallIntegerField('Enviar Mensagens', default=6)

    def __str__(self):
        return self.role_name


# Predefined list of user possibilites to the UserRoles table
class UserRolesList(models.Model):
    role_name = models.CharField('Função do Usuário', max_length=40, blank=False)
    budget_managment = models.PositiveSmallIntegerField('Controle Financeiro', default=0)
    members_managment = models.PositiveSmallIntegerField('Gestão de Usuários', default=4)
    reports_managment = models.PositiveSmallIntegerField('Gestão de Relatórios', default=2)
    members_access = models.PositiveSmallIntegerField('Acesso a Membros', default=4)
    agenda_access = models.PositiveSmallIntegerField('Acesso à Agenda', default=6)
    internetInteraction = models.PositiveSmallIntegerField('interação com outros membros',
                                                           default=7)  # users Interaction
    sendMessages = models.PositiveSmallIntegerField('Enviar Mensagens', default=6)

    def __str__(self):
        return self.role_name


# This is the invitation list of users to the candidate
# It stores the Invitator ID and email, the name and email of the Invited
# and the candidate id for which he was nominated.
# Team member list
class Invites(models.Model):
    invitator_email = models.CharField(max_length=50)
    invited_name = models.CharField(max_length=60, null=True, blank=True)
    invited_email = models.CharField(max_length=60)
    invited_cel = models.CharField(max_length=20, null=True, blank=True)
    candidate = models.ManyToManyField(Candidate)
    invite_status = models.CharField(max_length=10, choices=CANDIDATE_INVITE_CHOICES, blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.invited_name


class CandidateRequests(models.Model):
    user_email = models.CharField(max_length=50)
    candidator_email = models.CharField(max_length=60, null=True, blank=True)
    request_status = models.CharField(max_length=10, blank=True, null=True)
    # REQUEST or INVITE
    request_type = models.CharField(max_length=10, blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)


class ScopeList(models.Model):
    name = models.CharField(max_length=60)
    is_template = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    user = models.ForeignKey(User, blank=True, null=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Proposal(models.Model):
    name = models.CharField(max_length=60)
    description = models.CharField(max_length=255, null=True, blank=True)
    scope = models.ForeignKey(ScopeList, blank=True, null=True, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.name


class Keyword(models.Model):
    keyword = models.CharField(max_length=60)
    # user = models.ForeignKey(User, blank=True, null=True)
    # Positive(P) and Negative(N)
    type = models.CharField(max_length=10, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.keyword


class TempUser(models.Model):
    username = models.TextField('User Name', blank=True, null=True)
    email = models.TextField('Email', blank=True, null=True)
    # ex 'Committees'
    kind = models.TextField('Type', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.username
