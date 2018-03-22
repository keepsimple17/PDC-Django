# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-03-22 00:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserCandidates',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField()),
                ('candidate_id', models.IntegerField()),
                ('created_date', models.DateField(auto_now=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='candidate_city',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='candidate_email',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='candidate_estado',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='candidate_name',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='candidate_political_party',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='id_candidate',
        ),
    ]
