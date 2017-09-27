from django.conf.urls import include, url
from PDC.atividades import views as AtividadesViews

urlpatterns = [
    url(r'^$', AtividadesViews.index, name="index"),
    url(r'^(?P<pk>\d+)/$', AtividadesViews.detalhes , name='detalhes'),
    #url(r'^(?P<slug>[\w_-]+)/$', AtividadesViews.detalhes, name='detalhes'),
]