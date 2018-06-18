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

from dashboard.serializers import UsuarioSerializer

candidato = {
    'candidato': "João Amoedo",
    'candidato_UF': 'BR',
    'candidato_city': 'Rio de Janeiro',
    'candidato_intended_position': "Presidente",
    'ballot': "Eleições 2018"
}


@login_required
def index(request):
    usuario = UsuarioSerializer(request.user.usuario).data

    return render(request, 'index.html', candidato)

@login_required
def stats(request):
    return render(request, 'stats/resumo.html', candidato)
