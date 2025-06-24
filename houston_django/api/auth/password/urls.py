from django.urls import path

from api.auth.password.views import RequestPasswordResetView, CompletePasswordResetView

urlpatterns = [
    path("reset/request/", RequestPasswordResetView.as_view()),
    path("reset/complete/", CompletePasswordResetView.as_view()),
]
