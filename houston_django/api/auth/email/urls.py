from django.urls import path

from api.auth.email.views import EmailAvailableView, EmailValidateView, ConfirmEmailView

urlpatterns = [
    path("available/", EmailAvailableView.as_view()),
    path("validate/", EmailValidateView.as_view()),
    path("confirm/", ConfirmEmailView.as_view()),
]
