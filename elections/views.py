from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import (
    filters, generics, permissions, status, views, viewsets)

from elections.models import Dispute
from elections.serializers import DisputeSerializer


def index(request):
    return HttpResponse('Página de Eleições')


class DisputeViewSet(viewsets.ModelViewSet):
    queryset = Dispute.objects.all()
    serializer_class = DisputeSerializer
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, )
    ordering_fields = ('-id',)
    ordering = ('-id',)
    filter_fields = ('id', 'candidate')
