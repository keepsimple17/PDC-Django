# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-03-23 10:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0002_auto_20180323_1856'),
        ('dashboard', '0002_auto_20180322_0055'),
    ]

    operations = [
        migrations.DeleteModel(
            name='UserCandidates',
        ),
        migrations.AddField(
            model_name='usuario',
            name='candidates',
            field=models.ManyToManyField(blank=True, to='candidato.Candidate'),
        ),
    ]
