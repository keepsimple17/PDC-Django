# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-03-26 10:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_auto_20180323_1856'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='company',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='Endereço'),
        ),
    ]
