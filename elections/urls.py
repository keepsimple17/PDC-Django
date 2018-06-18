from django.conf.urls import include, url
from elections import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'dispute', views.DisputeViewSet)

urlpatterns = [
    url(r'', include(router.urls), name='api'),
    url(r'^$', views.index, name='index'),
]
