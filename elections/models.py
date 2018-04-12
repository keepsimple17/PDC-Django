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
    kind_of_position = models.CharField("Cargo Pretendido", max_length=30,
                                        choices=KIND_OF_POSITION, null=False)
