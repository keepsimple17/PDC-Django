# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-05-03 02:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0007_auto_20180420_1303'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='user_political_party',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
