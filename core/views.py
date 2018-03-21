import json
from itertools import chain

from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.decorators import login_required, user_passes_test

from django.shortcuts import render, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes, force_text
from core.data_objects import get_cities_by_state
from dashboard.models import Usuario, Estado, Municipio
#from dashboard.models import Usuario
from django.db import transaction
from core.forms import UserForm, ProfileForm, UserUpdateForm
from core.tokens import account_activation_token
from django.conf import settings
from django.contrib.auth import login, authenticate
from django.core.mail import EmailMessage
from django.contrib.auth.models import User

from django.utils.translation import ugettext_lazy as _

def index(request):
    if request.user.is_authenticated():
        return redirect("/dashboard/")
    else:
        return redirect(settings.LOGIN_URL)


def signup(request):
    if request.method == 'POST':
        print('Here')
        form = UserForm(request.POST)
        if form.is_valid():
            print('form validated')
            user = form.save(commit=False)
            user.is_active = False
            user.save()
            current_site = get_current_site(request)
            mail_subject = 'Activate your blog account.'
            message = render_to_string('acc_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            print('message', message)
            to_email = form.cleaned_data.get('email', None)
            email = EmailMessage(
                        mail_subject, message, to=[to_email]
            )
            print('to_email', to_email)
            email.send()
            # return HttpResponse('Please confirm your email address to complete the registration')
            return render(request, "registration/token_confirmation.html")
    else:
        print('this is get request')
        form = UserForm()

    return render(request, "registration/signup.html", {'form': form})

def activate_old(request, uidb64, token, backend='django.contrib.auth.backends.ModelBackend'):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user, backend='django.contrib.auth.backends.ModelBackend')
        return redirect('home')
    else:
        return HttpResponse('Activation link is invalid!')

def activate(request, uidb64, token, backend='django.contrib.auth.backends.ModelBackend'):
    form = UserForm()
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        return render(request, "registration/firstsetup.html", {'form': form, 'valid': True})
    else:
        return render(request, "registration/firstsetup.html", {'form': form, 'valid': False})
        # return HttpResponse('Activation link is invalid!')

def signup_confirm(request):
    if request.method == 'POST':
        print ('request.POST', request.POST)
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
        user_form = UserUpdateForm(request.POST,instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.usuario)
        if user_form.is_valid() and profile_form.is_valid():# and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, _('Your profile was successfully updated!'))
            return redirect('profile')
        else:
            messages.warning(request, _('Please correct the error below.'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.usuario)

    cities=get_cities_by_state(request.user.usuario.estado)
    return render(request, 'profile.html', {
        'user_form': user_form,
        'profile_form': profile_form,
        'cities' : cities,
        'selected_city' : int(request.user.usuario.cidade)
    })


def updateCities(request):
    state_id=request.GET['stateId']
    cities=get_cities_by_state(state_id)
    return render(request, 'cities_drop_down.html', {'cities': cities})