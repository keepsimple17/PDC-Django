from django.conf.urls import include, url
from rest_framework.routers import DefaultRouter
from candidato import views as CandidateViews

router = DefaultRouter()

router.register(r'invites', CandidateViews.InvitesViewSet)
router.register(r'scope_list', CandidateViews.ScopeListViewSet)
router.register(r'proposal_list', CandidateViews.ProposalListViewSet)
router.register(r'keyword', CandidateViews.KeywordViewSet)
router.register(r'keyword_list', CandidateViews.KeywordListViewSet)
router.register(r'candidate', CandidateViews.CandidateViewSet)
router.register(r'candidate_list', CandidateViews.CandidateListViewSet)

urlpatterns = [
    url(r'', include(router.urls), name='api'),
    url(r'^$', CandidateViews.home, name="home"),
    url(r'^usuario/$', CandidateViews.usuario, name='usuario'),
    url(r'^save_proposal/$', CandidateViews.save_proposal, name='save_proposal'),
    url(r'^process_keyword/$', CandidateViews.process_keyword, name='process_keyword'),
    url(r'^primeiroLogin/$', CandidateViews.usuarioPrimeiraConfig, name='PrimeiroLoginUsuario'),
    # url(r'^(?P<pk>\d+)/$', CandidateViews.detalhes , name='detalhes'),
    # url(r'^(?P<slug>[\w_-]+)/$', AtividadesViews.detalhes, name='detalhes'),
]
