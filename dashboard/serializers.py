# django
from core.serializers import AccountSerializer
# app
from dashboard.models import Usuario
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from rest_framework import serializers


class UsuarioSerializer(serializers.ModelSerializer):
    user = AccountSerializer(many=False)

    class Meta:
        model = Usuario
        fields = ('id', 'user', 'gender', 'marital_status', 'cpf', 'birthday_date', 'cep', 'estado',
                  'cidade', 'bairro', 'address', 'company', 'cellPhone', 'landlinePhone', 'email_verified',
                  'cellPhone_verified', 'user_political_party', 'user_profile_photo', 'created_date',
                  'updated_at', 'user_status', 'user_roles_list', 'candidates',)

        read_only_fields = ('created', )
