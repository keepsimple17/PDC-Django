# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-25 01:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0008_invites_invite_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='invites',
            name='updated_at',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
