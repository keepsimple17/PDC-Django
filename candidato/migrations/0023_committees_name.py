# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-05-22 11:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0022_auto_20180522_0659'),
    ]

    operations = [
        migrations.AddField(
            model_name='committees',
            name='name',
            field=models.TextField(blank=True, null=True),
        ),
    ]
