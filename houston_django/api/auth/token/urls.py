from django.urls import path

from api.auth.token.views import (
    TokenCreateView,
    TokenRefreshView,
)

urlpatterns = [
    path("", TokenCreateView.as_view()),
    path("refresh/", TokenRefreshView.as_view()),
]
