# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-05-24 11:10
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidato', '0023_committees_name'),
    ]

    operations = [
        migrations.RenameField(
            model_name='candidate',
            old_name='google',
            new_name='googlep',
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_blog_rss_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='candidate_blog_rss_url',
            field=models.URLField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='facebook_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='facebook_url',
            field=models.URLField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='googlep_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='googlep_url',
            field=models.URLField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='instagram_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='instagram_url',
            field=models.URLField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='twitter_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='twitter_url',
            field=models.URLField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='youtube_img',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='candidate',
            name='youtube_url',
            field=models.URLField(blank=True, null=True),
        ),
    ]
