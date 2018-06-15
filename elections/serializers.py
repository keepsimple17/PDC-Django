# django
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from rest_framework import serializers
# app
from core.serializers import AccountSerializer
from elections.models import Ballot, Position, Dispute
from dashboard.models import Usuario


class BallotSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ballot
        fields = ('id', 'name', 'election_date', 'created')

        read_only_fields = ('created', )


class PositionSerializer(serializers.ModelSerializer):
    ballot = BallotSerializer(many=False)

    class Meta:
        model = Position
        fields = ('id', 'ballot', 'position', 'kind_of_position', 'uf', 'citie', 'created')

        read_only_fields = ('created', )


class DisputeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Dispute
        fields = (
            'id', 'position', 'state', 'citie', 'candidate', 'political_party', 'is_user', 'facebook', 'facebook_img',
            'facebook_url', 'twitter', 'twitter_img', 'twitter_url', 'googlep', 'googlep_img', 'googlep_url',
            'youtube', 'youtube_img', 'youtube_url', 'instagram', 'instagram_img', 'instagram_url', 'created')

        read_only_fields = ('created', )
