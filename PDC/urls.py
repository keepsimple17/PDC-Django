"""PDC URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
#from PDC.principal.views import home
from django.contrib.auth import views
from PDC.principal import urls as urlsPrincipal

from PDC.principal.forms import LoginForm


urlpatterns = [
    url(r'^login/$', views.login, {'template_name': 'login.html', 'authentication_form':LoginForm},'django.contrib.auth.views.login', ),
    url(r'^logout/$', views.logout,{'next_page':'/login'}),
    url(r'^', include(urlsPrincipal, namespace="principal")),  # para organizar as Urls dos proj/apps em pastas
    url(r'^admin/', include(admin.site.urls)),
]
