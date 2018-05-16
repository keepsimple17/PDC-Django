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
from core.data_objects import (get_cities_by_state, get_states, get_cities, get_user_roles_list, get_political_parties,
                               get_scope_template)
from dashboard.models import (Usuario, Estado, Municipio, Candidate, GENDER_CHOICES, ESTADO_CIVIL_CHOICES)
from dashboard.serializers import UsuarioSerializer
from candidato.models import CANDIDATE_POSITION_CHOICES, Invites, CandidateRequests, UserRoles, Candidate
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
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.utils.translation import ugettext_lazy as _
from django.template.defaulttags import register
from rest_framework.response import Response
from rest_framework import generics, status
from rest_framework.decorators import api_view


# It' the firstSetup, with updated template
@login_required()
@csrf_protect
def primeiro_setup(request):
    user = request.user
    user_id = user.id
    choice_states = get_states()
    user_cities = get_cities_by_state(request.user.usuario.estado)
    candidate_cities = ()
    user_roles_list = get_user_roles_list()
    scope_list = get_scope_template(user_id)
    choice_states.insert(0, ('', "Preencha o estado."))
    # sever_url = request.build_absolute_uri('/')
    political_parties = get_political_parties()
    sever_url = get_current_site(request)
    is_invited_candidato = False

    choice_states = tuple(choice_states)

    user_form = UserForm(instance=request.user)
    profile_form = ProfileForm(instance=request.user.usuario)
    candidate_form = CandidateForm()

    try:
        candidator = request.user.candidate
        if candidator:
            candidate_form = CandidateForm(instance=candidator)
            candidate_cities = get_cities_by_state(candidator.candidate_state)
    except:
        candidate_form = CandidateForm()

    if request.method == 'GET':
        print('get request in primeiro_setup')

    if request.method == 'POST':
        print('post request in primeiro_setup')
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(request.POST, request.FILES, instance=request.user.usuario)
        candidate_form = CandidateForm(request.POST, request.FILES)

        user_email = request.user.email

        if profile_form.is_valid():
            user_roles_list_data = profile_form.cleaned_data.get('user_roles_list', None)
            role_name = user_roles_list_data.role_name
            profile_form.save()
            profile_form = ProfileForm(instance=request.user.usuario)
            if role_name == 'Candidato':
                # start user is candidate
                print('case candidator')

                if candidate_form.is_valid():
                    try:
                        candidator = request.user.candidate
                        if candidator:
                            candidate_form = CandidateForm(request.POST, instance=candidator)
                            candidate_form.save()
                    except:
                        candidate_form = CandidateForm(request.POST)

                    candidator_data = candidate_form.save(commit=False)
                    print('testing-->', candidator_data.id)
                    if not candidator_data.id:
                        candidator_data.user = request.user
                        candidator_data.save()
                else:
                    print('candidate_form is not valid')
                # end user is candidate
            else:
                # messages.warning(request, _('We are supporting only a Candidato. '
                #                             'Please choose Candidato in Função na Campanha.'))
                if candidate_form.is_valid():
                    campaign_email = candidate_form.cleaned_data['campaign_email']
                    candidate_request = CandidateRequests(
                        user_email=user_email,
                        candidator_email=campaign_email,
                        request_status='REQUESTED',
                        updated_at=timezone.now(),
                    )

                    candidator = Candidate.objects.filter(campaign_email=campaign_email).first()
                    if candidator:
                        # start candidator exist
                        print('candidator exist')
                        candidate_request.request_type = 'REQUEST'
                        current_site = get_current_site(request)
                        mail_subject = 'Aprovar solicitação do usuário.'
                        # need to address by tulga
                        uidb64 = '123'

                        message = render_to_string('mail/candidator_aprove_user.html', {
                            'user_email': user_email,
                            'uid': uidb64,
                            'domain': current_site.domain,
                        })

                        to_email = campaign_email
                        email = EmailMessage(
                            mail_subject, message, to=[to_email]
                        )
                        email.content_subtype = "html"
                        try:
                            email.send()
                            exist_candidator_request = CandidateRequests.objects.filter(candidator_email=campaign_email,
                                                                                        user_email=user_email,
                                                                                        request_type='REQUEST').first()
                            if exist_candidator_request:
                                exist_candidator_request.updated_at = timezone.now()
                                exist_candidator_request.save()
                            else:
                                candidate_request.save()

                        except SMTPException as e:
                            print('There was an SMTPException: ', e)
                            messages.warning(request, _('There was an SMTPException: ' + str(e)))
                        except Exception as e:
                            print('There was an error sending an email: ', e)
                            messages.warning(request, _('There was an SMTPException: ' + str(e)))
                        # end candidator exist
                    else:
                        candidate_request.request_type = 'INVITE'
                        # start candidator not exist
                        print('candidator not exist')
                        current_site = get_current_site(request)
                        mail_subject = 'Convidar Candidato.'
                        # need to address by tulga
                        uidb64 = '123'

                        message = render_to_string('mail/user_invite_candidator.html', {
                            'user_email': user_email,
                            'domain': current_site.domain,
                            'uid': uidb64,
                        })

                        to_email = campaign_email
                        email = EmailMessage(
                            mail_subject, message, to=[to_email]
                        )
                        email.content_subtype = "html"
                        try:
                            email.send()
                            exist_candidator_request = CandidateRequests.objects.filter(candidator_email=campaign_email,
                                                                                        user_email=user_email,
                                                                                        request_type='INVITE').first()
                            if exist_candidator_request:
                                exist_candidator_request.updated_at = timezone.now()
                                exist_candidator_request.save()
                            else:
                                candidate_request.save()
                        except SMTPException as e:
                            print('There was an SMTPException: ', e)
                            messages.warning(request, _('There was an SMTPException: ' + str(e)))
                        except Exception as e:
                            print('There was an error sending an email: ', e)
                            messages.warning(request, _('There was an SMTPException: ' + str(e)))
                        # end candidator not exist
                else:
                    print('candidate form is not valid')

            print('testing now valid->', user_roles_list_data.role_name)
        else:
            print('testing now errors->', profile_form.errors)

    return render(request, "registration/primeiro_setup/primeiroSetup.html", {
        'user_id': user_id,
        'user_form': user_form,
        'profile_form': profile_form,
        'candidate_form': candidate_form,
        'sever_url': sever_url,
        'user_cities': user_cities,
        'candidate_cities': candidate_cities,
        'scope_list': scope_list,
        'states': choice_states,
        'user_roles_list': user_roles_list,
        'GENDER_CHOICES': GENDER_CHOICES,
        'CANDIDATE_POSITION_CHOICES': CANDIDATE_POSITION_CHOICES,
        'ESTADO_CIVIL_CHOICES': ESTADO_CIVIL_CHOICES,
        'political_parties': political_parties,
        'is_invited_candidato': is_invited_candidato,
    })


@api_view(['GET', 'POST', ])
def add_team_member(request, format=None):
    try:
        data = json.loads(request.body.decode('utf-8'))
    except:
        # data = request.POST
        data = request.data
    # print(request.data)
    team_member_name = data.get('team_member_name', None)
    team_member_email = data.get('team_member_email', None)
    team_member_cel = data.get('team_member_cel', None)
    permission_list = data.get('permission_list', None)
    invitor_email = data.get('invitor_email', None)

    user_profile = Usuario.objects.filter(user__username=team_member_name)
    candidate_invite = Invites.objects.filter(invitator_email=invitor_email, invited_email=team_member_email).first()

    if len(user_profile) == 0:
        user_profile = Usuario.objects.filter(user__email=team_member_email)
        if len(user_profile) == 0:
            user_profile = Usuario.objects.filter(cellPhone=team_member_cel)
    if len(user_profile) > 0:
        # start User exist in system
        print('user exist')
        user_profile_data = UsuarioSerializer(user_profile[0]).data
        print('user_profile_data', user_profile_data['user']['is_staff'])
        is_active = user_profile_data['user']['is_staff']
        if is_active:
            # User is active
            print('user active')
            if candidate_invite:
                return Response({
                    'status': 'exist',
                    'message': 'The User is already invited.',
                    # 'body': json.dumps('')
                }, status=status.HTTP_200_OK)
            else:
                candidate_invite = Invites(
                    invitator_email=invitor_email,
                    invited_email=team_member_email,
                    invited_name=team_member_name,
                    invited_cel=team_member_cel,
                    invite_status='I',  # INATIVO
                    updated_at=timezone.now(),
                )
                candidate_invite.save()
                user_roles = UserRoles(
                    invite=candidate_invite,
                    budget_managment=permission_list[0],
                    members_managment=permission_list[1],
                    reports_managment=permission_list[2],
                    members_access=permission_list[3],
                    agenda_access=permission_list[4],
                    internetInteraction=permission_list[5],
                    sendMessages=permission_list[6],
                )
                user_roles.save()

                # should send an email to the user
                uidb64 = urlsafe_base64_encode(force_bytes(candidate_invite.pk))

                current_site = get_current_site(request)
                mail_subject = 'Aceite um convite no SCOPO (Sistema de Controle do POlítro)'

                message = render_to_string('mail/candidator_invite_user.html', {
                    'invitor_email': invitor_email,
                    'uid': uidb64,
                    'domain': current_site.domain,
                })

                to_email = team_member_email
                email = EmailMessage(
                    mail_subject, message, to=[to_email]
                )
                email.content_subtype = "html"

                try:
                    email.send()
                except SMTPException as e:
                    return Response({
                        'status': 'NotFound',
                        'message': 'Email address not exist.' + str(e),
                    }, status=status.HTTP_404_NOT_FOUND)
                except Exception as e:
                    return Response({
                        'status': 'NotFound',
                        'message': 'Email address not exist.' + str(e),
                    }, status=status.HTTP_404_NOT_FOUND)

                return Response({
                    'status': 'invited',
                    'message': 'System sent an invite email to user.',
                    'body': InvitesSerializer(candidate_invite).data,
                }, status=status.HTTP_201_CREATED)

            # start User exist in system
        else:
            # start User is not active
            print('user not active')
            # end User is not active
    else:
        # start User not exist
        print('user not exist')
        body = None
        invited_date = None

        if candidate_invite:
            invited_date = candidate_invite.updated_at
            candidate_invite.updated_at = timezone.now()
            candidate_invite.save()
        else:
            candidate_invite = Invites(
                invitator_email=invitor_email,
                invited_email=team_member_email,
                invited_name=team_member_name,
                invited_cel=team_member_cel,
                invite_status='I',  # INATIVO
                updated_at=timezone.now(),
            )
            body = InvitesSerializer(candidate_invite).data
            candidate_invite.save()

            user_roles = UserRoles(
                invite=candidate_invite,
                budget_managment=permission_list[0],
                members_managment=permission_list[1],
                reports_managment=permission_list[2],
                members_access=permission_list[3],
                agenda_access=permission_list[4],
                internetInteraction=permission_list[5],
                sendMessages=permission_list[6],
            )
            user_roles.save()

        print('candidate_invite pk ---> ', candidate_invite.pk)
        uidb64 = urlsafe_base64_encode(force_bytes(candidate_invite.pk))

        current_site = get_current_site(request)
        mail_subject = 'Aceite um convite no SCOPO (Sistema de Controle do POlítro)'

        message = render_to_string('mail/invite_user.html', {
            'invitor_email': invitor_email,
            'uid': uidb64,
            'domain': current_site.domain,
        })

        to_email = team_member_email
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        email.content_subtype = "html"

        try:
            email.send()
            print('to_email', to_email)
        except SMTPException as e:
            print('There was an SMTPException: ', e)
            if invited_date is None:
                candidate_invite.delete()
            return Response({
                'status': 'NotFound',
                'message': 'Email address not exist.' + str(e),
            }, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            print('There was an error sending an email: ', e)
            if invited_date is None:
                candidate_invite.delete()
            return Response({
                'status': 'NotFound',
                'message': 'Email address not exist.' + str(e),
            }, status=status.HTTP_404_NOT_FOUND)

        return Response({
            'status': 'created',
            'message': 'System sent an invite email to user.',
            'body': body,
        }, status=status.HTTP_201_CREATED)
        # end User not exist

    return Response({
        'status': 'Success',
        'message': 'System received your request.',
    }, status=status.HTTP_200_OK)


# need to tweak by tulga, please don't change this.
# team member invite
def account_accept_invite(request, uidb64=None):
    uid = force_text(urlsafe_base64_decode(uidb64))
    invite = Invites.objects.get(pk=uid)
    candidate = Candidate.objects.get(campaign_email=invite.invitator_email)
    print('uid==>', candidate.usuarioes)
    user_form = UserForm(initial={
        'email': invite.invited_email,
        'username': invite.invited_name,
    })
    candidate_form = CandidateForm(instance=candidate)

    if request.method == 'GET':
        return render(request, "first_configuration/new_member_accept_invite.html", {
            'uid': uidb64,
            'user_form': user_form,
            'candidate_form': candidate_form,
        })
    else:
        user_form = UserForm(request.POST)
        if user_form.is_valid():
            user = user_form.save(commit=False)
            user.save()
            usuario = Usuario.objects.get(user=user)

            candidate.usuarioes.add(usuario)
            candidate.save()

            usuario.candidates.add(candidate)
            usuario.save()

            # should be added userroles table
            user_role = UserRoles.objects.get(invite=invite)
            user_role.user = usuario
            user_role.candidate = candidate
            user_role.save()

            messages.success(request, _('Criei sua conta com sucesso.'))

        return render(request, "first_configuration/new_member_accept_invite.html", {
            'uid': uidb64,
            'user_form': user_form,
            'candidate_form': candidate_form,
        })


def account_candidator_aprove_user(request, uidb64=None):
    uid = force_text(urlsafe_base64_decode(uidb64))
    invite = Usuario.objects.filter(pk=uid)
    candidate = Candidate.objects.filter(campaign_email=invite.invitator_email)
    if candidate:
        candidate.save()
    return HttpResponse("The Candidator approved your request")


def account_accept_candidator_invite(request, uidb64=None):
    uid = force_text(urlsafe_base64_decode(uidb64))
    invite = Candidate.objects.filter(pk=uid)
    candidate = Usuario.objects.filter(campaign_email=invite.invitator_email)
    if candidate:
        candidate.save()

    return HttpResponse("You completed the invitation")
