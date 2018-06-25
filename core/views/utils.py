import datetime
import json
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from rest_framework import permissions, status, views, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response

from candidato.models import (
    CANDIDATE_POSITION_CHOICES, POLITICAL_PARTY_CHOICES, Candidate, CandidateRequests, Invites)
from candidato.serializers import InvitesSerializer
from core.data_objects import (
    get_cities, get_cities_by_state, get_states, get_user_roles_list)
from core.forms import CandidateForm, ProfileForm, UserForm, UserUpdateForm
from core.tokens import account_activation_token
from dashboard.models import (
    ESTADO_CIVIL_CHOICES, GENDER_CHOICES, POLITICAL_PARTY_CHOICES, Candidate, Estado, Municipio, Usuario)
from dashboard.serializers import UsuarioSerializer


class UtilView(views.APIView):

    # renderer_classes = (JSONPRenderer, JSONRenderer)

    def post(self, request, format=None):
        try:
            data = json.loads(request.body.decode('utf-8'))
        except:
            data = request.POST
        # data = request.POST
        username = data.get('username', None)
        password = data.get('password', None)
        print('login->', username, password)

        return Response({
            'status': 'Status',
            'message': 'This is message body.',
        }, status=status.HTTP_202_ACCEPTED)

    def get(self, request, format=None):
        return Response({
            'status': 'Status',
            'message': 'This is message body.',
        }, status=status.HTTP_202_ACCEPTED)
