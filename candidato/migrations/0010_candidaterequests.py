# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-26 03:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0009_invites_updated_at'),
    ]

    operations = [
        migrations.CreateModel(
            name='CandidateRequests',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_email', models.CharField(max_length=50)),
                ('candidator_email', models.CharField(blank=True, max_length=60, null=True)),
                ('invited_email', models.CharField(max_length=60)),
                ('request_status', models.CharField(blank=True, max_length=10, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
        ),
    ]