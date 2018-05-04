from django import template
from django.template import Template
from django.conf import settings
from urllib.parse import urljoin

register = template.Library()


@register.simple_tag()
def media_uri(_image_uri, *args, **kwargs):
    uri = settings.AWS_MEDIA_URL + '/' + settings.AWS_PUBLIC_MEDIA_LOCATION + '/' + str(_image_uri)
    return uri
