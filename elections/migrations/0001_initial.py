# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-12 22:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ballot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('election_date', models.DateField(verbose_name='Data Pleito Eleitoral')),
            ],
        ),
        migrations.CreateModel(
            name='Position',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('position', models.CharField(max_length=50)),
                ('kind_of_position', models.CharField(choices=[('municipal', 'Municipal'), ('estadual', 'Estadual'), ('federal', 'Federal'), ('distrital', 'Distrital'), ('outro', 'Outro')], max_length=30, verbose_name='Tipo de Cargo')),
                ('uf', models.CharField(blank=True, max_length=2, null=True)),
                ('citie', models.CharField(blank=True, max_length=255, null=True)),
                ('ballot', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='elections.Ballot')),
            ],
        ),
    ]
