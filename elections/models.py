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

