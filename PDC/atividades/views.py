from django.shortcuts import render

# Create your views here.

from .models import Evento


def index(request):
    tiposOrigem = {
        0 : 'fa fa-gears',
        1 : 'fa fa-exclamation-triangle',
        2 : 'fa fa-database',
        3 : 'fa fa-user',
        4 : 'fa fa-users',
        5 : 'fa fa-rss-square',
        6 : 'fa fa-rss-square',
        7 : 'fa fa-money',
        8 : 'fa fa-facebook'
    }

    tpOrigens = {'sistema','dados','admin'}

    eventos = Evento.objects.all()
    template_name = 'eventos/index.html'
    context = {
        'eventos': eventos,
        'tiposOrigem': tiposOrigem,
        'tpOrigem': tpOrigens,
    }
    return render(request,template_name, context)