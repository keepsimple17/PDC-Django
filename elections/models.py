from django.db import models

KIND_OF_POSITION = (
    ('municipal', 'Municipal'),
    ('estadual', 'Estadual'),
    ('federal', 'Federal'),
    ('distrital', 'Distrital'),
    ('outro', 'Outro'),
)


# Pleito Eleitoral - Year and kind of campaing
class Ballot(models.Model):
    name = models.CharField(max_length=50)
    election_date = models.DateField('Data Pleito Eleitoral')
    created = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.name


class Position(models.Model):
    ballot = models.ForeignKey(Ballot, on_delete=models.CASCADE)
    position = models.CharField(max_length=50)
    kind_of_position = models.CharField(
        "Tipo de Cargo", max_length=30, choices=KIND_OF_POSITION, null=False)

    # Federal State - Get from the dashboard_estado
    uf = models.CharField(max_length=2, null=True, blank=True)

    # city of desired position - get from dashboard_municipio
    citie = models.CharField(max_length=255, null=True, blank=True)
    created = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.position


class Dispute(models.Model):
    position = models.ForeignKey(Position, blank=True, null=True, on_delete=models.CASCADE)
    state = models.CharField(max_length=40, blank=True, null=True)
    citie = models.CharField(max_length=40, blank=True, null=True)
    candidate = models.ForeignKey('candidato.Candidate', blank=True, on_delete=models.CASCADE)
    political_party = models.ManyToManyField('dashboard.PoliticalParties', blank=True)
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
    created = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.candidate
