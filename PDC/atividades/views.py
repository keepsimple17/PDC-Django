from django.shortcuts import render

# Create your views here.

from .models import Evento

def index(request):
    evento = Evento.objects.all()
    template_name = 'eventos/index.html'
    return render(request, template_name)
    context = {
        'eventos' : evento
    }
    return render(request,template_name, context)