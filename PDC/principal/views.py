from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def home(request):
    #return HttpResponse('CRM PDC')
    return render(request, 'home.html')

def chat(request):
    return render(request, 'page_ready_chat.html')
