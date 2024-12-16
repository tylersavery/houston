from django.urls import path

from api.auth.email.views import EmailAvailableView, EmailValidateView

urlpatterns = [
    path("available/", EmailAvailableView.as_view()),
    path("validate/", EmailValidateView.as_view()),
]
