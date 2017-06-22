from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth

from django.views.decorators.csrf import csrf_protect
#from django.core.context_processors import csrf

# Create your views here.

def login(request):
    #return HttpResponse('Login Page')
    return render(request, 'login.html')

def home(request):
    #return HttpResponse('CRM PDC')
    return render(request, 'home.html')

def chat(request):
    return render(request, 'page_ready_chat.html')
