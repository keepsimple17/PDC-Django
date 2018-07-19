import json

from candidato.models import Candidate, Invites, Keyword, Proposal, ScopeList
from candidato.serializers import (
    InvitesSerializer, KeywordListSerializer, KeywordSerializer, ProposalListSerializer, ProposalSerializer,
    ScopeListSerializer, CandidateSerializer, CandidateListSerializer)
from django.contrib.auth import authenticate, get_user_model, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, render_to_response
from rest_framework import (
    filters, generics, permissions, status, views, viewsets)
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend

# It' the candidate environment setup

#  return render(request, "registration/signup.html", {'form':form})


@login_required
def home(request):
    # Candidate Congiguration
    return HttpResponse('Ambiente de Configuração do Candidato')


def usuario(request):
    # User Configuration
    return HttpResponse('Ambiente de Configuração do Usuário')


def usuarioPrimeiraConfig(request):
    # todo Verify if the user is not a Candidate

    # User First Configuration - In the first login
    return HttpResponse('Primeira Configuração do Usuário')


@api_view(['GET', 'POST', ])
def save_proposal(request, format=None):
    try:
        data = json.loads(request.body.decode('utf-8'))
    except:
        # data = request.POST
        data = request.data
    name = data.get('name', None)
    description = data.get('description', None)
    scope = data.get('scope', None)
    candidator_id = data.get('candidator', None)
    proposal = Proposal(
        name=name,
        scope_id=scope,
        description=description,
    )
    proposal.save()
    candidator = Candidate.objects.filter(user=candidator_id)
    if candidator:
        candidator = Candidate.objects.get(user=candidator_id)
        candidator.proposals.add(proposal)
        candidator.save()
        return Response({
            'status': 'Success',
            'body': ProposalSerializer(proposal).data,
            'message': 'Your Proposal is saved successfully.',
        }, status=status.HTTP_200_OK)
    else:
        return Response({
            'status': 'Error',
            'message': 'User Not Found.',
        }, status=status.HTTP_404_NOT_FOUND)


@api_view(['GET', 'POST', ])
def process_keyword(request, format=None):
    try:
        data = json.loads(request.body.decode('utf-8'))
    except:
        # data = request.POST
        data = request.data
    process_type = data.get('process_type', None)
    keyword_type = data.get('keyword_type', None)
    keyword = data.get('keyword', None)
    user_id = data.get('user_id', None)

    candidator = Candidate.objects.filter(user=user_id)
    if candidator:
        candidator = candidator.first()
        if process_type == 'save':
            keyword_doc = Keyword(
                keyword=keyword,
                type=keyword_type,
            )
            keyword_doc.save()
            if keyword_type == 'P':
                candidator.positive_keywords.add(keyword_doc)

            if keyword_type == 'N':
                candidator.negative_keywords.add(keyword_doc)

            candidator.save()

        if process_type == 'remove':
            if keyword_type == 'P':
                keyword = candidator.positive_keywords.filter(keyword=keyword)
                if keyword:
                    keyword = keyword.first()
                    candidator.positive_keywords.remove(keyword)

            if keyword_type == 'N':
                keyword = candidator.negative_keywords.filter(keyword=keyword)
                if keyword:
                    keyword = keyword.first()
                    candidator.negative_keywords.remove(keyword)

            candidator.save()
        return Response({
            'status': 'Success',
            # 'body': KeywordSerializer(keyword_doc).data,
            'message': 'Your keyword is changed successfully.',
        }, status=status.HTTP_200_OK)
    else:
        return Response({
            'status': 'Error',
            'message': 'You are not candidator.',
        }, status=status.HTTP_404_NOT_FOUND)


class InvitesViewSet(viewsets.ModelViewSet):
    # permission_classes = (permissions.IsAdminUser,)
    queryset = Invites.objects.all()
    serializer_class = InvitesSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'invitator_email', 'invited_email', )


class ProposalListViewSet(viewsets.ModelViewSet):
    # permission_classes = (permissions.IsAdminUser,)
    queryset = Proposal.objects.all()
    serializer_class = ProposalListSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'name', 'description', 'scope_id')


class ScopeListViewSet(viewsets.ModelViewSet):
    queryset = ScopeList.objects.all()
    serializer_class = ScopeListSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'user_id')


class KeywordViewSet(viewsets.ModelViewSet):
    queryset = Keyword.objects.all()
    serializer_class = KeywordSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'type', 'keyword')


class KeywordListViewSet(viewsets.ModelViewSet):
    queryset = Keyword.objects.all()
    serializer_class = KeywordListSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'type', 'keyword')


class CandidateViewSet(viewsets.ModelViewSet):
    queryset = Candidate.objects.all()
    serializer_class = CandidateSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, DjangoFilterBackend)
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = (
        'id', 'campaign_desired_position', 'campaign_desired_position__position', 'state_campaign')


class CandidateListViewSet(viewsets.ModelViewSet):
    queryset = Candidate.objects.all()
    serializer_class = CandidateListSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, DjangoFilterBackend)
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'campaign_desired_position', 'campaign_desired_position__position')
