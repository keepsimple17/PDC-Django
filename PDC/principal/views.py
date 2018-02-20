from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required


from django.contrib.auth import (
    authenticate,
    get_user_model,
    login,
    logout,
)

from .forms import UserLoginForm

#from django.views.decorators.csrf import csrf_protect
#from django.core.context_processors import csrf

# Create your views here.

#to no allow to an view without authenticating
@login_required(login_url="login/")
def login_view(request):
    title = "Login PDC"
    form = UserLoginForm(request.POST or None)
    if form.is_valid():
        username = form.cleaned_data.get("username")
        password = form.cleaned_data.get('password')
    return render(request, 'form.html',{})

def register_view(request):
    return render(request, 'register.html',{})

@login_required(login_url="login/")
def home(request):
    #return HttpResponse('CRM PDC')
    dadosUsuario = {'usuario':'Paulino', 'candidato':'Collor', 'cidade_atual': 'Brasília',
                    'temp_cid_atual' : '25'}
    return render(request, 'home.html', dadosUsuario)

def chat(request):
    return render(request, 'page_ready_chat.html')
