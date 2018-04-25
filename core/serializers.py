# django
from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import update_session_auth_hash
# app
# from .models import (Vod)


class AccountSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=False)
    confirm_password = serializers.CharField(write_only=True, required=False)

    class Meta:
        model = User
        fields = ('id', 'email', 'username', 'is_superuser', 'is_staff', 'last_login',
                  'date_joined', 'first_name', 'last_name', 'password', 'confirm_password')
        read_only_fields = ('last_login', 'date_joined')
