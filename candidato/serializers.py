# django
from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import update_session_auth_hash
# app
from candidato.models import (Invites)


class InvitesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Invites
        fields = ('id', 'invitator_email', 'invited_name', 'invited_email', 'invited_cel',
                  'candidate', 'invite_status', 'updated_at')
