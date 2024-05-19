from django.conf import settings
from django.conf.urls import include
from django.urls import path

urlpatterns = []

if settings.ADMIN_ENABLED:
    urlpatterns.append(path(settings.ADMIN_URL_PATH, include("admin.urls")))

if settings.API_ENABLED:
    urlpatterns.append(path("v1/", include("api.urls")))

urlpatterns.append(path("accounts/", include("allauth.urls")))
