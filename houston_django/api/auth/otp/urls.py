from django.urls import path

from api.auth.otp.views import (
    OTPRequestEmailView,
    OTPEmailValidateView,
    OTPRequestPhoneView,
    OTPPhoneValidateView,
)

urlpatterns = [
    path("email/request/", OTPRequestEmailView.as_view()),
    path("email/validate/", OTPEmailValidateView.as_view()),
    path("phone/request/", OTPRequestPhoneView.as_view()),
    path("phone/validate/", OTPPhoneValidateView.as_view()),
]
