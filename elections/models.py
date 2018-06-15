from django.db import models

KIND_OF_POSITION =(
    ('municipal', 'Municipal'),
    ('estadual', 'Estadual'),
    ('federal', 'Federal'),
    ('distrital', 'Distrital'),
    ('outro','Outro'),
)

# Pleito Eleitoral - Year and kind of campaing
class Ballot(models.Model):
    name = models.CharField(max_length=50)
    election_date = models.DateField('Data Pleito Eleitoral')

class Position(models.Model):
    ballot = models.ForeignKey(Ballot)
    position = models.CharField(max_length=50)
    kind_of_position = models.CharField("Tipo de Cargo", max_length=30,
                                        choices=KIND_OF_POSITION, null=False)

    #Federal State - Get from the dashboard_estado
    uf = models.CharField(max_length=2, null=True, blank=True)

    #city of desired position - get from dashboard_municipio
    citie = models.CharField(max_length=255, null=True, blank=True)

class Dispute(models.Model):
    position = models.ForeignKey(Position)
    state = models.ManyToManyField('dashboard.Estado',blank=True)
    citie = models.ManyToManyField('dashboard.Municipio', blank=True, null=True)
    candidate = models.CharField(max_length=200)
    political_party = models.ManyToManyField('dashboard.PoliticalParties')
    is_user = models.BooleanField(default=False)
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
