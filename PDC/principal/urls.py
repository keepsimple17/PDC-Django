from django.conf.urls import url

from PDC.principal import views

urlpatterns = [
	url(r'^$', views.home, name='home'),
	url(r'^chat/$', views.chat, name='chat'),
	#url(r'^sobre/$', views.about, name='sobre'),
]