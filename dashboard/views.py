import os
from datetime import datetime
from itertools import chain
from time import gmtime, strftime

from dashboard.models import Usuario
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db import transaction
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect, render
from django.utils.translation import ugettext_lazy as _

# Create your views here.


@login_required
def index(request):
    # excel_list = []
    # print(request.user)
    return render(request, 'index.html', {})


@login_required
def stats(request):
    return render(request, 'stats/resumo.html')
