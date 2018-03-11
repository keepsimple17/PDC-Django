from itertools import chain

from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test

from django.shortcuts import render, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from dashboard.models import Profile
from django.db import transaction
from core.forms import UserForm, ProfileForm
from django.conf import settings
from django.contrib.auth import login, authenticate

from django.utils.translation import ugettext_lazy as _

def index(request):
    if request.user.is_authenticated():
        return redirect("/dashboard/")
    else:
        return redirect(settings.LOGIN_URL)

def signup(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
        else:
            print ("form not valid")
    else:
        form = UserForm()
    return render(request, "registration/signup.html", {'form':form})


@login_required
def profile(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        #profile_form = ProfileForm(request.POST, instance=request.user.profile)
        if user_form.is_valid():# and profile_form.is_valid():
            user_form.save()
            #profile_form.save()
            messages.success(request, _('Your profile was successfully updated!'))
            return redirect('profile')
        else:
            messages.warning(request, _('Please correct the error below.'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'profile.html', {
        'user_form': user_form,
        'profile_form': profile_form,
    })