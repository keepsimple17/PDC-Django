# django
from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import update_session_auth_hash
# app
from candidato.models import (Invites, Proposal, ScopeList)


class InvitesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Invites
        fields = ('id', 'invitator_email', 'invited_name', 'invited_email', 'invited_cel',
                  'candidate', 'invite_status', 'updated_at')


class ScopeListSerializer(serializers.ModelSerializer):
    class Meta:
        model = ScopeList
        fields = ('id', 'name', 'is_template', 'created_at', 'updated_at', )

        read_only_fields = ('created_at',)


class ProposalSerializer(serializers.ModelSerializer):
    scope = ScopeListSerializer(many=False)

    class Meta:
        model = Proposal
        fields = ('id', 'name', 'description', 'scope', 'created_at', 'updated_at', )

        read_only_fields = ('created_at',)


class ProposalListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposal
        fields = ('id', 'name', 'description', 'scope', 'created_at', 'updated_at', )

        read_only_fields = ('created_at',)
