# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-04 15:19
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0004_usuario_company'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='cellPhone',
            field=models.CharField(blank=True, max_length=15, null=True, validators=[django.core.validators.RegexValidator(code='Invalid number', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.", regex='^\\(?([0-9]{2})\\)? ([0-9]{4,5})[-. ]?([0-9]{4})$')]),
        ),
    ]
