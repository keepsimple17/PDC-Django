# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 08:36
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0025_auto_20180529_1407'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='candidate',
            name='campaign_desired_position',
        ),
        migrations.RemoveField(
            model_name='candidate',
            name='candidate_current_position',
        ),
        migrations.RemoveField(
            model_name='candidate',
            name='candidate_desired_position',
        ),
    ]
