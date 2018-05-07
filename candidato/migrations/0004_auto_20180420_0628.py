# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-20 09:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0003_auto_20180412_1244'),
    ]

    operations = [
        migrations.AddField(
            model_name='candidate',
            name='candidate_blog_rss',
            field=models.CharField(blank=True, max_length=40, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_city',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='Cidade'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_current_position',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name='Cargo Pretendido pelo Candidato'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_desired_position',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name='Cargo Pretendido pelo Candidato'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_state',
            field=models.CharField(blank=True, max_length=2, null=True, verbose_name='UF'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='first_election',
            field=models.BooleanField(default='False', verbose_name='Primeira Eleição'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='holds_position',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='Exerce Cargo'),
        ),
    ]