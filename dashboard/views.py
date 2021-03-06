import os
from datetime import datetime
from itertools import chain
from time import gmtime, strftime

from dashboard.models import Usuario
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db import transaction
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect, render
from django.utils.translation import ugettext_lazy as _

from dashboard.models import Usuario
from dashboard.serializers import UsuarioSerializer, UsuarioListSerializer
from candidato.models import Candidate
from candidato.serializers import CandidateSerializer

candidato = {
    'candidato': "João Amoedo",
    'candidato_UF': 'BR',
    'candidato_city': 'Rio de Janeiro',
    'candidato_intended_position': "Presidente",
    'ballot': "Eleições 2018",
    'tags': [
        {'tag': 'Partido Novo', 'size': 10},
        {'tag': 'Impostos', 'size': 7},
        {'tag': 'Renovação', 'size': 5},
        {'tag': 'Eleições', 'size': 1},
        {'tag': 'Fundo Partidário', 'size': 4},
        {'tag': 'Lava-Jato', 'size': 3},
    ]
}

available_candidator_nick_names = [
    'João Amoêdo', 'Jair Bolsonaro', 'Beto Richa', 'Ratinho Jr.', 'Leandro Lyra', 'João Doria', 'Marcelo Trindade']


@login_required
def index(request):
    usuario = UsuarioSerializer(request.user.usuario).data
    candidator_datas = usuario['candidates']
    return render(request, 'index.html', {
        'candidato': candidato,
        'usuario': usuario,
        'profile_form': usuario,
        'candidates': candidator_datas,
    })


@login_required
def index2(request):
    usuario = UsuarioSerializer(request.user.usuario).data
    candidator_datas = usuario['candidates']
    return render(request, 'index2.html', {
        'candidato': candidato,
        'usuario': usuario,
        'profile_form': usuario,
        'candidates': candidator_datas,
    })


@login_required
def stats(request):
    usuario = UsuarioSerializer(request.user.usuario).data
    candidator_datas = usuario['candidates']
    for candidate in candidator_datas:
        candidate_usuario = Usuario.objects.filter(id=candidate['user'])
        if candidate_usuario:
            candidate['user'] = UsuarioListSerializer(candidate_usuario.first()).data
    if not request.user.is_staff:
        return render(request, 'index.html', {
            'candidato': candidato,
            'usuario': usuario,
            'profile_form': usuario,
        })
    # candidates = []
    # candidator_datas = []
    # for nick_name in available_candidator_nick_names:
    #     candidate = Candidate.objects.filter(candidate_political_nickname=nick_name)
    #     if candidate:
    #         candidates.append(candidate.first())
    #
    # for candidate in candidates:
    #     candidator_datas.append(CandidateSerializer(candidate).data)

    return render(request, 'stats/resumo.html', {
        'candidato': candidato,
        'usuario': usuario,
        'profile_form': usuario,
        'candidates': candidator_datas,
    })
