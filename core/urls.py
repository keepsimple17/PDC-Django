"""excelweb URL Configuration
The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
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
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
import django.contrib.auth.views as auth_views
# from core import views
#
# urlpatterns = [
#     url(r'^admin/', admin.site.urls),
#     url(r'^$', views.index, name='home'),
#     url(r'^profile/$', views.profile, name='profile'),
#     url(r'^updateCities', views.update_cities, name='updateCities'),
#     url(r'^accounts/login/$', auth_views.login, name="login"),
#     url(r'^accounts/signup/$', views.signup, name="signup"),
#     url(r'^accounts/candidatesignup/(?P<uidb64>[0-9A-Za-z_\-]+)/$', views.candidate_signup, name="candidate_signup"),
#     url(r'^accounts/logout/$', auth_views.logout, {'next_page': '/'}, name="logout"),
#     url(r'^oauth/', include('social_django.urls', namespace='social')),
#     url(r'^dashboard/', include('dashboard.urls', namespace='dashboard')),
#     url(r'candidato/', include('candidato.urls', namespace='candidato')),
#     url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
#         views.activate, name='activate'),
#     url(r'^cep/', include('cep.urls')),
#     url(r'^account/firstsetup', views.firstsetup, name="firstsetup"),
#     # the template update for the firstsetup
#     url(r'^account/primeiroSetup', views.primeiroSetup, name="primeiroSetup"),
#     # password reset
#     url(r'^password_reset/$', auth_views.password_reset, name='password_reset'),
#     url(r'^approve_user/$', views.apporve_user, name='apporve_user'),
#     url(r'^password_reset/done/$', auth_views.password_reset_done, name='password_reset_done'),
#     url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
#         auth_views.password_reset_confirm, name='password_reset_confirm'),
#     url(r'^reset/done/$', auth_views.password_reset_complete, name='password_reset_complete'),
#     url(r'^elections/', include('elections.urls', namespace='elections')),
# ] + static('settings.STATIC_URL', document_root=settings.STATIC_ROOT)
#
# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
