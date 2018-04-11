from django.conf.urls import include, url
from candidato import views as CandidateViews

urlpatterns = [
    url(r'^$', CandidateViews.home, name="home"),
    url(r'^usuario/$', CandidateViews.usuario, name='usuario'),
    url(r'^primeiroLogin/$', CandidateViews.usuarioPrimeiraConfig, name='PrimeiroLoginUsuario'),
    #url(r'^(?P<pk>\d+)/$', CandidateViews.detalhes , name='detalhes'),
    #url(r'^(?P<slug>[\w_-]+)/$', AtividadesViews.detalhes, name='detalhes'),
]