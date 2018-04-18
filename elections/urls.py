from django.conf.urls import include, url
from elections import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]
