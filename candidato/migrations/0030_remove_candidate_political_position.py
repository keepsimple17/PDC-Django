# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 08:48
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0029_auto_20180622_0547'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='candidate',
            name='political_position',
        ),
    ]