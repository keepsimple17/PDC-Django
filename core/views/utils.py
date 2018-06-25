import datetime
import json
import csv
import codecs
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.template.defaultfilters import slugify
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
    ESTADO_CIVIL_CHOICES, GENDER_CHOICES, POLITICAL_PARTY_CHOICES, Estado, Municipio, Usuario, PoliticalParties)
from dashboard.serializers import UsuarioSerializer


class UtilView(views.APIView):

    # renderer_classes = (JSONPRenderer, JSONRenderer)

    def post(self, request, format=None):
        try:
            data = json.loads(request.body.decode('utf-8'))
        except:
            data = request.POST
        csv_file = request.FILES["csv_file"]
        if not csv_file.name.endswith('.csv'):
            return Response({
                'status': 'error',
                'message': 'file format error.',
            }, status=status.HTTP_400_BAD_REQUEST)

        if csv_file.multiple_chunks():
            return Response({
                'status': 'error',
                'message': 'file size error.',
            }, status=status.HTTP_400_BAD_REQUEST)

        file_data = csv_file.read().decode("utf-8")
        reader = csv.reader(file_data.splitlines(), delimiter=',', dialect=csv.excel_tab)
        next(reader, None)
        # print('length...->', len(reader))

        for line in reader:
            print('fields..', line[2])
            candidate = Candidate.objects.filter(candidate_political_nickname=line[1])
            if not candidate:
                candidate_dispute_party = PoliticalParties.objects.filter(sigla__contains=line[2])
                if candidate_dispute_party:
                    candidate_dispute_party = candidate_dispute_party.first()
                    candidate = Candidate(
                        candidate_political_nickname=line[1],
                        campaign_desired_position_id=line[0],
                        candidate_dispute_party=candidate_dispute_party,
                        canditate_Election_Ballot=line[3],
                        state_campaign=line[4],
                        candidate_site=line[6],
                        twitter=line[7],
                        facebook=line[8],
                        instagram=line[9],
                    )
                    candidate.save()

        return Response({
            'status': 'Status',
            'message': 'This is message body.',
        }, status=status.HTTP_202_ACCEPTED)

    def get(self, request, format=None):
        return Response({
            'status': 'Status',
            'message': 'This is message body.',
        }, status=status.HTTP_202_ACCEPTED)
