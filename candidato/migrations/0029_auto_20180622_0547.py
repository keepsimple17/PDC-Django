# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 08:47
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0028_auto_20180622_0542'),
    ]

    operations = [
        migrations.RenameField(
            model_name='candidate',
            old_name='first_election',
            new_name='first_political_campaign',
        ),
    ]