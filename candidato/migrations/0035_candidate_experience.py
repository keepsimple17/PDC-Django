# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 17:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0034_auto_20180622_1140'),
    ]

    operations = [
        migrations.AddField(
            model_name='candidate',
            name='experience',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]