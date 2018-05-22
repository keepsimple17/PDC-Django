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
import core.views.index as views
import core.views.first_configuration as fc_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name='home'),
    url(r'^profile/$', views.profile, name='profile'),
    url(r'^updateCities', views.update_cities, name='updateCities'),
    url(r'^accounts/login/$', auth_views.login, name="login"),
    url(r'^accounts/signup/$', views.signup, name="signup"),
    url(r'^browser_view/$', views.browser_view, name="browser_view"),
    url(r'^accounts/candidatesignup/(?P<uidb64>[0-9A-Za-z_\-]+)/$', views.candidate_signup, name="candidate_signup"),
    url(r'^accounts/logout/$', auth_views.logout, {'next_page': '/'}, name="logout"),
    url(r'^oauth/', include('social_django.urls', namespace='social')),
    url(r'^dashboard/', include('dashboard.urls', namespace='dashboard')),
    url(r'candidato/', include('candidato.urls', namespace='candidato')),
    url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        views.activate, name='activate'),
    url(r'^cep/', include('cep.urls')),
    url(r'^account/firstsetup', views.firstsetup, name="firstsetup"),
    # the template update for the firstsetup
    url(r'^account/primeiroSetup', fc_views.primeiro_setup, name="primeiro_setup"),
    url(r'^account/add_team_member', fc_views.add_team_member, name='account_add_user_roles'),
    url(r'^account/add_committee', fc_views.add_committee, name='account_add_committee'),
    # email confirmation
    url(r'^account/account_accept_invite/(?P<uidb64>[0-9A-Za-z_\-]+)', fc_views.account_accept_invite,
        name='account_accept_invite'),
    url(r'^account/account_candidator_aprove_user/(?P<uidb64>[0-9A-Za-z_\-]+)', fc_views.account_candidator_aprove_user,
        name='account_candidator_aprove_user'),
    url(r'^account/account_accept_candidator_invite/(?P<uidb64>[0-9A-Za-z_\-]+)', fc_views.account_accept_candidator_invite,
        name='account_accept_candidator_invite'),
    # apis
    url(r'^account/check_username', views.check_username, name='check_username'),
    url(r'^account/check_email', views.check_email, name='check_email'),
    # password reset
    url(r'^password_reset/$', auth_views.password_reset, name='password_reset'),
    url(r'^approve_user/$', views.apporve_user, name='apporve_user'),
    url(r'^user_configuration', views.user_configuration, name='user_configuration'),
    url(r'^update_user_configuration/$', views.update_user_configuration, name='update_user_configuration'),
    url(r'^password_reset/done/$', auth_views.password_reset_done, name='password_reset_done'),
    url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        auth_views.password_reset_confirm, name='password_reset_confirm'),
    url(r'^reset/done/$', auth_views.password_reset_complete, name='password_reset_complete'),
    url(r'^elections/', include('elections.urls', namespace='elections')),
    url(r'^teste404/', views.teste404),
] + static('settings.STATIC_URL', document_root=settings.STATIC_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
