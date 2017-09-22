from django.shortcuts import render

# Create your views here.

from .models import Evento

def index(request):
    eventos = Evento.objects.all()
    template_name = 'eventos/index.html'
    context = {
        'eventos': eventos
    }
    return render(request,template_name, context)