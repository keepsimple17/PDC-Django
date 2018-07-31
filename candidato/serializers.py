# django
# app
from candidato.models import Candidate, Invites, Keyword, Proposal, ScopeList
from elections.models import Ballot, Position
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from rest_framework import serializers


# duplicated serializer
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


# serializers for election app
class InvitesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Invites
        fields = (
            'id', 'invitator_email', 'invited_name', 'invited_email', 'invited_cel', 'candidate', 'invite_status',
            'updated_at',
        )


class ScopeListSerializer(serializers.ModelSerializer):
    class Meta:
        model = ScopeList
        fields = ('id', 'name', 'is_template', 'created_at', 'updated_at', 'user')

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


class KeywordSerializer(serializers.ModelSerializer):
    # user = CandidateSerializer

    class Meta:
        model = Keyword
        fields = ('id', 'keyword', 'type', 'created_at', 'updated_at', )

        read_only_fields = ('created_at',)


class KeywordListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Keyword
        fields = ('id', 'keyword', 'type', 'created_at', 'updated_at', )

        read_only_fields = ('created_at',)


class CandidateSerializer(serializers.ModelSerializer):
    proposals = ProposalSerializer(many=True)
    positive_keywords = KeywordSerializer(many=True)
    negative_keywords = KeywordSerializer(many=True)
    campaign_desired_position = PositionSerializer(many=False)

    class Meta:
        model = Candidate
        fields = (
            'id', 'user', 'candidate_political_nickname', 'candidate_dispute_party', 'candidate_party',
            'canditate_Election_Ballot', 'experience', 'campaign_desired_position', 'state_campaign', 'candidate_state',
            'candidate_city', 'city_campaign', 'candidate_dispute_number', 'slug', 'political_position', 'reelection',
            'first_political_campaign',  'candidate_site', 'campaign_email', 'facebook', 'facebook_img', 'facebook_url',
            'twitter', 'twitter_img', 'twitter_url', 'googlep', 'googlep_img', 'googlep_url', 'youtube', 'youtube_img',
            'youtube_url', 'instagram', 'instagram_img', 'instagram_url', 'candidate_blog_rss', 'rejection_rate',
            'intention_rate', 'candidate_blog_rss_img', 'candidate_blog_rss_url', 'proposals', 'foto',  'resume', 'obs',
            'candidate_situation', 'positive_keywords', 'negative_keywords', 'created_at', 'updated_at',
        )

        read_only_fields = ('created_at',)


class CandidateListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Candidate
        fields = (
            'id', 'user', 'candidate_political_nickname', 'candidate_dispute_party', 'candidate_party',
            'canditate_Election_Ballot', 'experience', 'campaign_desired_position', 'state_campaign', 'candidate_state',
            'candidate_city', 'city_campaign', 'candidate_dispute_number', 'slug', 'political_position', 'reelection',
            'first_political_campaign', 'candidate_site', 'campaign_email', 'facebook', 'facebook_img', 'facebook_url',
            'twitter', 'twitter_img', 'twitter_url', 'googlep', 'googlep_img', 'googlep_url', 'youtube', 'youtube_img',
            'youtube_url', 'instagram', 'instagram_img', 'instagram_url', 'candidate_blog_rss', 'rejection_rate',
            'intention_rate', 'candidate_blog_rss_img', 'candidate_blog_rss_url', 'proposals', 'foto', 'resume', 'obs',
            'candidate_situation', 'positive_keywords', 'negative_keywords', 'created_at', 'updated_at',
        )

        read_only_fields = ('created_at',)
