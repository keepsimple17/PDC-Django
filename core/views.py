# import json
# from itertools import chain

from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse
from django.shortcuts import render, redirect
# from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes, force_text
from core.data_objects import get_cities_by_state
from dashboard.models import Usuario, Estado, Municipio, POLITICAL_PARTY_CHOICES
# from dashboard.models import Usuario
# from django.db import transaction
from core.forms import UserForm, ProfileForm, UserUpdateForm, CandidateForm
from core.tokens import account_activation_token
from django.conf import settings
from django.contrib.auth import login, authenticate
from django.core.mail import EmailMessage
from smtplib import SMTPException
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from candidato.models import Candidate

from django.utils.translation import ugettext_lazy as _


def index(request):
    if request.user.is_authenticated():
        return redirect("/dashboard/")
    else:
        return redirect(settings.LOGIN_URL)


def signup(request, uidb64=None):
    if request.method == 'POST':
        form = UserForm(request.POST)
        print('this is post request')
        if form.is_valid():
            print('form validated')
            user = form.save(commit=False)
            user.is_active = False
            # user.save()

            current_site = get_current_site(request)
            mail_subject = 'Ative sua conta na SCOPO (Sistema de COntrole POlítico)'
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
            try:
                email.send()
                user.save()
            except SMTPException as e:
                print('There was an SMTPException: ', e)
                messages.warning(request, _('There was an SMTPException: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})
            except Exception as e:
                print('There was an error sending an email: ', e)
                messages.warning(request, _('There was an error sending an email: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})

            # return HttpResponse('Por favor confirme o enviado para sua caixa-postal para prosseguir com o registro!')
            return render(request, "registration/token_confirmation.html")
        else:
            print('form not valid')

    else:
        print('this is get request')
        form = UserForm()

    return render(request, "registration/signup.html", {'form': form})


def candidate_signup(request, uidb64=None):
    if request.method == 'POST':
        print('Here')
        form = UserForm(request.POST)
        if form.is_valid():
            print('form validated')
            user = form.save(commit=False)
            user.is_active = True
            user.is_staff = False
            user.save()

            # adding user_id to candidate table
            try:
                uid = force_text(urlsafe_base64_decode(uidb64))
                candidate = Candidate.objects.get(pk=uid)
            except(TypeError, ValueError, OverflowError, User.DoesNotExist):
                candidate = None
            print('user id', user.pk)
            candidate.user_id = user.pk
            candidate.save()
            
            return redirect(settings.LOGIN_URL)

    else:
        print('this is get request', uidb64)
        form = UserForm()
        return render(request, "registration/candidate_signup.html", {'form': form, 'uidb64': uidb64})


def firstsetup(request):

    user_id = request.POST['user_id']
    user = User.objects.get(pk=user_id)

    candidate_form = CandidateForm(request.POST)    
    profile_form = ProfileForm(request.POST, instance=user.usuario)

    if candidate_form.is_valid():
        print('candidate_form validated')
        candidate = candidate_form.save(commit=False)
        candidate.save()
        print('candidate id', candidate.id)
        print('uid', urlsafe_base64_encode(force_bytes(candidate.id)))
        current_site = get_current_site(request)
        mail_subject = 'You are invited to PDC site as Candidate!'
        message = render_to_string('candidate_invite_email.html', {
            'user': candidate,
            'domain': current_site.domain,
            'uid': urlsafe_base64_encode(force_bytes(candidate.id)),
        })
        print('message', message)
        to_email = candidate_form.cleaned_data.get('campaign_email', None)
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        print('to_email', to_email)
        email.send()

    if profile_form.is_valid():
        print('profile_form validated')
        profile_form.save()
        messages.success(request, _('Seu Cadastro foi Atualizado!'))
    
    login(request, user, backend='django.contrib.auth.backends.ModelBackend')
    return redirect('home')


def activate(request, uidb64, token, backend='django.contrib.auth.backends.ModelBackend'):
    form = UserForm()
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.is_staff = False
        user.save()
        profile_form = ProfileForm(instance=user.usuario)
        print('user.usuario', user.usuario)
        return render(request, "registration/firstsetup.html", {'form': form,
                                                                'profile_form': profile_form,
                                                                'political_legends': POLITICAL_PARTY_CHOICES,
                                                                'user_id': user.id,
                                                                'valid': True})
    else:
        return render(request, "registration/firstsetup.html", {'form': form, 'valid': False})
        # return HttpResponse('Activation link is invalid!')


def signup_confirm(request):
    if request.method == 'POST':
        print('request.POST', request.POST)
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
        else:
            print("Formulário Inválido")
    else:
        form = UserForm()
    return render(request, "registration/signup.html", {'form': form})


@login_required
def profile(request):
    if request.method == 'POST':
        print('request.user', request.user)
        # print('request.user.usuario', request.user.usuario)
        user_form = UserUpdateForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.usuario)
        password_form = PasswordChangeForm(request.user, request.POST)
        # and profile_form.is_valid():
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, _('Seu Cadastro foi Atualizado!'))
            # change pw
            if password_form.is_valid():
                user = password_form.save()
                # updating pw very very Important!!!!
                update_session_auth_hash(request, user)
                messages.success(request, 'Your password was successfully updated!')
            return redirect('profile')
        else:
            messages.warning(request, _('Por favor corrija os erros abaixo.'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.usuario)
        password_form = PasswordChangeForm(request.user)

    cities = get_cities_by_state(request.user.usuario.estado)
    selected_city = request.user.usuario.cidade
    if selected_city is None:
        selected_city = 0
    return render(request, 'profile.html', {
        'user_form': user_form,
        'profile_form': profile_form,
        'cities': cities,
        'password_form': password_form,
        'selected_city': int(selected_city)
    })


def update_cities(request):
    state_id = request.GET['stateId']
    cities = get_cities_by_state(state_id)
    return render(request, 'cities_drop_down.html', {'cities': cities})


def forgot_password(request, uidb64=None):
    if request.method == 'POST':
        form = UserForm(request.POST)
        print('this is post request')
        if form.is_valid():
            print('form validated')
            user = form.save(commit=False)
            user.is_active = False
            # user.save()

            current_site = get_current_site(request)
            mail_subject = 'Ative sua conta na SCOPO (Sistema de COntrole POlítico)'
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
            try:
                email.send()
                user.save()
            except SMTPException as e:
                print('There was an SMTPException: ', e)
                messages.warning(request, _('There was an SMTPException: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})
            except Exception as e:
                print('There was an error sending an email: ', e)
                messages.warning(request, _('There was an error sending an email: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})

            # return HttpResponse('Por favor confirme o enviado para sua caixa-postal para prosseguir com o registro!')
            return render(request, "registration/token_confirmation.html")
        else:
            print('form not valid')

    else:
        print('this is get request')
        form = UserForm()

    return render(request, "registration/signup.html", {'form': form})

def apporve_user(request):
    user_id=request.GET["user_id"]
    user=User.objects.get(id=user_id)
    mail_subject = 'you are authorized to dashboard'
    message = render_to_string('authorization_mail.html')
    to_email = user.email
    email = EmailMessage(
                mail_subject, message, to=[to_email]
    )
    print('to_email', to_email)
    user.is_staff=1
    user.save()
    email.send()
    return HttpResponse("activated")