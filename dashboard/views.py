from itertools import chain

from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test

from django.shortcuts import render, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from dashboard.models import Usuario
from django.db import transaction
from django.utils.translation import ugettext_lazy as _

import os
from django.conf import settings

from time import gmtime, strftime
from datetime import datetime
# Create your views here.


@login_required
def index(request):
    # excel_list = []
    if request.user.is_superuser:
        print("super user")
    else:
        print("normal user")
    return render(request, 'index.html', {})
