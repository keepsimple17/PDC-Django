# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-06-22 14:20
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0031_auto_20180622_0550'),
    ]

    operations = [
        migrations.AlterField(
            model_name='candidate',
            name='campaign_desired_position',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='position_in_campaign_desired_position', to='elections.Position', verbose_name='Cargo de Disputa'),
        ),
        migrations.AlterField(
            model_name='candidate',
            name='candidate_dispute_party',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='dashboard.PoliticalParties', verbose_name='Candidate Dispute Party'),
        ),
        migrations.AlterField(
            model_name='candidate',
            name='political_position',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='position_in_political_position', to='elections.Position', verbose_name='Posição Politica que Exerce'),
        ),
    ]
