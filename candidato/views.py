from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required

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
    return HttpResponse('Ambiente de Configuração do Candidato') #Candidate Congiguration

def usuario(request):
    return HttpResponse('Ambiente de Configuração do Usuário') #User Configuration

def usuarioPrimeiraConfig(request):
    #todo Verify if the user is not a Candidate

    return HttpResponse('Primeira Configuração do Usuário')  # User First Configuration - In the first login
