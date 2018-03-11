from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import RegexValidator
import os

POLITICAL_PARTY_CHOICES = (
    ('decratic', 'Democratic'),
    ('republic', 'Republic'),
    ('beer', 'Beer'),
)

class Profile(models.Model):
    # This will represent an user account profile entity

    user = models.OneToOneField(User, null=False, blank=False)
    location = models.CharField(max_length=50, blank=True, null=True)
    political_party = models.CharField(max_length=50, choices=POLITICAL_PARTY_CHOICES, blank=True, null=True)
    phone = models.CharField(blank=True, null=True, max_length=15,
                             validators=[RegexValidator(regex='^\+?1?\d{9,15}$',
                                                        message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.",
                                                        code='Invalid number')])
    created_date = models.DateField(auto_now=True, null=True, blank=True)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()