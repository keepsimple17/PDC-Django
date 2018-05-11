# import json
# from itertools import chain

from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils import timezone
import json
import datetime
# from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes, force_text
from core.data_objects import (get_cities_by_state, get_states, get_cities, get_user_roles_list)
from dashboard.models import (Usuario, Estado, Municipio, Candidate, POLITICAL_PARTY_CHOICES,
                              GENDER_CHOICES, ESTADO_CIVIL_CHOICES)
from dashboard.serializers import UsuarioSerializer
from candidato.models import CANDIDATE_POSITION_CHOICES, Invites, CandidateRequests
from candidato.serializers import InvitesSerializer
from core.forms import UserForm, ProfileForm, UserUpdateForm, CandidateForm
from core.tokens import account_activation_token
from django.conf import settings
from django.contrib.auth import login, authenticate
from django.core.mail import EmailMessage
from smtplib import SMTPException
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from candidato.models import Candidate, POLITICAL_PARTY_CHOICES
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.utils.translation import ugettext_lazy as _
from django.template.defaulttags import register
from rest_framework.response import Response
from rest_framework import generics, status
from rest_framework.decorators import api_view


def index(request):
    if request.user.is_authenticated():
        return redirect("/dashboard/")
    else:
        return redirect(settings.LOGIN_URL)


@csrf_protect
def signup(request, uidb64=None):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            print('form validated')
            user = form.save(commit=False)
            user.is_active = False
            user.save()

            current_site = get_current_site(request)
            mail_subject = 'Ative sua conta na SCOPO (Sistema de COntrole POlítico)'
            # should save the user before getting user.pk
            message = render_to_string('authorization.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user)})

            to_email = form.cleaned_data.get('email', None)
            email = EmailMessage(
                        mail_subject, message, to=[to_email]
            )
            email.content_subtype = "html"
            print('to_email', to_email)
            try:
                email.send()
            except SMTPException as e:
                print('There was an SMTPException: ', e)
                # when occurring any exception, remove the user from user table.
                user.delete()
                messages.warning(request, _('There was an SMTPException: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})
            except Exception as e:
                print('There was an error sending an email: ', e)
                user.delete()
                messages.warning(request, _('There was an error sending an email: ' + str(e)))
                return render(request, "registration/signup.html", {'form': form})

            # return HttpResponse('Por favor confirme o enviado para sua caixa-postal para prosseguir com o registro!')
            return render(request, "registration/token_confirmation.html")
        else:
            print('form not valid')
            # messages.error(request, "Error")
            # form = UserForm()
            return render(request, "registration/signup.html", {'form': form})

    else:
        print('this is get request')
        form = UserForm()

    return render(request, "registration/signup.html", {'form': form})


@csrf_protect
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


@api_view(['GET'])
def check_username(request):
    if request.method == 'GET':
        username = request.GET['username']
        user = User.objects.filter(username=username)
        if len(user) == 0:
            return Response(True, status=status.HTTP_200_OK)
        else:
            return Response(False, status=status.HTTP_200_OK)


@api_view(['GET'])
def check_email(request):
    if request.method == 'GET':
        email = request.GET['email']
        user = User.objects.filter(email=email)
        if len(user) == 0:
            return Response(True, status=status.HTTP_200_OK)
        else:
            return Response(False, status=status.HTTP_200_OK)


@csrf_protect
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
        mail_subject = 'Parabéns Candidato. Vc foi adicionado no SCOPO Online'
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
        email.content_subtype = "html "
        print('to_email', to_email)
        email.send()

    if profile_form.is_valid():
        print('profile_form validated')
        profile_form.save()
        messages.success(request, _('Seu Cadastro foi Atualizado!'))

    login(request, user, backend='django.contrib.auth.backends.ModelBackend')
    return redirect('home')


@csrf_protect
def activate(request, uidb64, token, backend='django.contrib.auth.backends.ModelBackend'):
    if request.method == 'GET':
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

            return redirect('primeiro_setup')
        else:
            return render(request, "registration/firstsetup.html", {'form': form,
                                                                    'uid': uidb64,
                                                                    'token': token,
                                                                    'valid': False})
    else:
        data = request.POST
        username = data.get('username', None)
        password = data.get('password', None)
        user = authenticate(username=username, password=password)
        if user is not None:
            current_site = get_current_site(request)
            mail_subject = 'Ative sua conta na SCOPO (Sistema de COntrole POlítico)'
            # should save the user before getting user.pk
            message = render_to_string('authorization.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user)})

            to_email = user.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.content_subtype = 'html'

            try:
                email.send()
            except SMTPException as e:
                print('There was an SMTPException: ', e)
                # when occurring any exception, remove the user from user table.
                user.delete()
                messages.warning(request, _('There was an SMTPException: ' + str(e)))
                return render(request, "registration/firstsetup.html", {'valid': False,
                                                                        'uid': uidb64,
                                                                        'token': token})
            except Exception as e:
                print('There was an error sending an email: ', e)
                user.delete()
                messages.warning(request, _('There was an error sending an email: ' + str(e)))
                return render(request, "registration/firstsetup.html", {'valid': False,
                                                                        'uid': uidb64,
                                                                        'token': token})
            messages.success(request, _('Por favor, confirme seu email para completar seu cadastro.'))
            return render(request, "registration/firstsetup.html", {'valid': False,
                                                                    'uid': uidb64,
                                                                    'token': token})
        else:
            messages.warning(request, _('Not Authorized.'))
            return render(request, "registration/firstsetup.html", {'valid': False,
                                                                    'uid': uidb64,
                                                                    'token': token})


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
    if selected_city is None or selected_city == '':
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
    print('state_id', state_id)
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
    user_id = request.GET["user_id"]
    user = User.objects.get(id=user_id)
    mail_subject = 'you are authorized to dashboard'
    message = render_to_string('authorization.html', {
        'user': user.first_name+" "+user.last_name})
    to_email = user.email
    email = EmailMessage(
                mail_subject, message, to=[to_email]
    )
    email.content_subtype = "html"
    user.is_staff = 1
    user.save()
    email.send()
    return HttpResponse("activated")


def browser_view(request):
    user_id = request.GET["id"]
    user = User.objects.get(id=int(user_id))
    current_site = get_current_site(request)
    return render(request, 'authorization.html', {
        'user': user,
        'domain': current_site.domain,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_activation_token.make_token(user),
    })
    # return HttpResponse(True)


@login_required()
def user_configuration(request):
    if request.user.is_authenticated():
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.usuario)
        candidate_form = CandidateForm()
        choice_states = get_states()
        choice_cities = get_cities()
        user_roles_list = get_user_roles_list()
        choice_states.insert(0, (None, "Preencha o estado."))
        choice_cities.insert(0, (None, "Encha a cidade."))

        choice_states = tuple(choice_states)
        choice_cities = tuple(choice_cities)
        return render(request, "registration/primeiro_setup/primeiroSetup.html", {
            'user_form': user_form,
            'profile_form': profile_form,
            'candidate_form': candidate_form,
            'cities': choice_cities,
            'states': choice_states,
            'user_roles_list': user_roles_list,
            'GENDER_CHOICES': GENDER_CHOICES,
            'CANDIDATE_POSITION_CHOICES': CANDIDATE_POSITION_CHOICES,
            'ESTADO_CIVIL_CHOICES': ESTADO_CIVIL_CHOICES,
            'POLITICAL_PARTY_CHOICES': POLITICAL_PARTY_CHOICES})


@csrf_exempt
def update_user_configuration(request):
    print('updating user configuration now')
    if request.method == 'POST':
        # user_config_form = ProfileForm(request.POST, instance=request.user.usuario)
        # candidate_user = Candidate.objects.get(user_id=request.user.id)
        print('updating user configuration now')
        # if candidate_user:
        #     candidate_config_form = CandidateForm(request.POST, instance=request.user.candidate)
        # else:
        #     candidate_config_form = CandidateForm(request.POST)
        # print(user_config_form.errors)
        # if user_config_form.is_valid():
        #     print("saving", user_config_form.save())
        #     messages.success(request, _('Seu Cadastro foi Atualizado!'))
        # if candidate_config_form.is_valid():
        #     print("saving", candidate_config_form.save())
        #     messages.success(request, _('Seu Cadastro foi Atualizado!'))
        return redirect("/dashboard/")


@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)


def teste404(request):
    return render(request, "pag404.html")
