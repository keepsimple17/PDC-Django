from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from rest_framework import generics, permissions, filters, status, views, viewsets
from candidato.models import Invites
from candidato.serializers import InvitesSerializer

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


class InvitesViewSet(viewsets.ModelViewSet):
    # permission_classes = (permissions.IsAdminUser,)
    queryset = Invites.objects.all()
    serializer_class = InvitesSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'invitator_email', 'invited_email', )
