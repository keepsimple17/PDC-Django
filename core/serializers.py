# django
from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import update_session_auth_hash
# app
# from .models import (Vod)


# class VodSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Vod
#         fields = ('id', 'division', 'created', 'title', 'media_type', 'duration', 'kinds',
#                   'is_hit', 'hit_created', 'is_popular', 'popular_created', 'declaration',
#                   'creator', 'vod_category', 'media_id', 'media_thumbnail', 'video_height',
#                   'video_width', 'duration',)
#         read_only_fields = ('created', )
