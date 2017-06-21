import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

#fom b33tl3
sys.path.append('/home/port4lfo/PDC/')
from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "PDC.settings")

application = get_wsgi_application()

