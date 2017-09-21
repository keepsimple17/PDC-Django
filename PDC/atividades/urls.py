from django.conf.urls import include, url
from PDC.atividades import views as AtividadesViews

urlpatterns = [
    url(r'^$', AtividadesViews.index, name="index"),
]