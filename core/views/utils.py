import datetime
import json
import csv
from pymongo import MongoClient
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.views.decorators.csrf import csrf_exempt, csrf_protect
from django.template.defaultfilters import slugify
from django.utils.crypto import get_random_string
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
    def read_csv(self, request):
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
        return reader

    def post(self, request, format=None):
        try:
            data = json.loads(request.body.decode('utf-8'))
        except:
            data = request.POST
        kind = data.get('kind', None)
        if kind == 'import_candidate':
            reader = self.read_csv(request)
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

        if kind == 'update_candidate':
            reader = self.read_csv(request)
            for line in reader:
                print('fields..', line[2])
                candidate = Candidate.objects.filter(candidate_political_nickname=line[1])
                if candidate:
                    candidate = candidate.first()
                    if not candidate.user:
                        username = slugify(line[1])
                        if not User.objects.filter(username=username).exists():
                            password = get_random_string(length=10)
                            email = None
                            user = User.objects.create_user(username, email, password)
                            user.is_staff = True
                            user.save()
                            candidate.user = user
                            candidate.save()

            return Response({
                'status': 'Status',
                'message': 'This is message body.',
            }, status=status.HTTP_202_ACCEPTED)

        return Response({
            'status': 'Status',
            'message': 'there is no kind.',
        }, status=status.HTTP_202_ACCEPTED)

    def get(self, request, format=None):
        return Response({
            'status': 'Status',
            'message': 'This is message body.',
        }, status=status.HTTP_202_ACCEPTED)


is_copying = False


class CopyMongoDBView(views.APIView):
    def get(self, request, format=None):
        atlas_uri = 'mongodb://superuser:Uaw7TOJgSDQ77gsh@pdcdeep-shard-00-00-nho8i.mongodb.net:27017,pdcdeep-shard-00-01-nho8i.mongodb.net:27017,pdcdeep-shard-00-02-nho8i.mongodb.net:27017/test?ssl=true&replicaSet=PdcDeep-shard-0&authSource=admin&retryWrites=true'
        # atlas_host = 'pdcdeep-shard-00-00-nho8i.mongodb.net'
        # atlas_username = 'superuser'
        # atlas_password = 'Uaw7TOJgSDQ77gsh'
        ec2_uri = 'mongodb://deepsuperuser:ZUUPFQ9GJkm%7DU@18.218.2.246:27017/admin'
        # ec2_host = '18.218.2.246'
        # ec2_username = 'deepsuperuser'
        # ec2_password = 'ZUUPFQ9GJkm%7DU'
        global is_copying
        if is_copying:
            return Response({
                'status': 'success',
                'message': 'copying...',
            }, status=status.HTTP_202_ACCEPTED)
        else:
            is_copying = True
            atlas_client = MongoClient(atlas_uri)
            atlas_collection = atlas_client['scope_db']['twitter_tweets']

            ec2_client = MongoClient(ec2_uri)
            ect_collection = ec2_client['scope_db']['twitter_tweets']
            while True:
                entity = ect_collection.find_one({'$or': [{'copied': False}, {'copied': {'$ne': True}}]})
                if entity:
                    del entity['_id']
                    print('find..', entity.get('copied'), entity.get('id'))
                    atlas_collection.update({'id': entity['id']}, {'$set': entity}, upsert=True)
                    ect_collection.update({'id': entity['id']}, {'$set': {'copied': True}}, upsert=False)
                else:
                    break
            # atlas_collection.insert_one(entity)

            return Response({
                'status': 'success',
                'message': 'received request successfully',
            }, status=status.HTTP_202_ACCEPTED)
