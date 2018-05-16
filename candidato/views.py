from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from rest_framework import generics, permissions, filters, status, views, viewsets
from candidato.models import Invites, Proposal, Candidate, ScopeList
from candidato.serializers import InvitesSerializer, ProposalListSerializer, ScopeListSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
import json

from django.contrib.auth import (
    authenticate,
    get_user_model,
    login,
    logout,
)

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
            'message': 'Your Proposal is saved successfully.',
        }, status=status.HTTP_200_OK)
    else:
        return Response({
            'status': 'Error',
            'message': 'User Not Found.',
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
