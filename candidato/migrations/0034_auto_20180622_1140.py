# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 14:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0033_auto_20180622_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='candidate',
            name='first_political_campaign',
            field=models.BooleanField(default=False, verbose_name='Primeira Eleição'),
        ),
        migrations.AddField(
            model_name='candidate',
            name='reelection',
            field=models.BooleanField(default=False, verbose_name='Tentando Reeleição'),
        ),
    ]