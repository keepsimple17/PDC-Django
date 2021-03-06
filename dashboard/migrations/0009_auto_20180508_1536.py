# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-05-08 18:36
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0008_auto_20180502_2302'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='cellPhone',
            field=models.CharField(blank=True, max_length=17, null=True, validators=[django.core.validators.RegexValidator(code='Invalid number', message="Phone number must be entered in the format: '+999999999'. Up to 17 digits allowed.", regex='^\\(?([0-9]{2})\\)? ([0-9]{4,5})[-. ]?([0-9]{4})$')]),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='landlinePhone',
            field=models.CharField(blank=True, max_length=17, null=True, verbose_name='Telefone Fixo'),
        ),
    ]
