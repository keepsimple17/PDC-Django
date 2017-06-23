from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth import views as auth_views

from PDC.principal import views

urlpatterns = [
	url(r'^$', views.home, name='home'),
	url(r'^chat/$', views.chat, name='chat'),
	#url(r'^sobre/$', views.about, name='sobre'),


    #user auth urls
	#url(r'^login/', views.login, name='login'),
    #url(r'^auth/$', views.auth_view),
    #url(r'^logout/$', views,logout),
    #url(r'^loggedin/$', views.loggedin),
    #url(r'^invalid/$', views.invalid_login),

    #auth teste 2
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', auth_views.logout, name='logout'),

]