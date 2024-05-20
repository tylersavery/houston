from django.urls import path

from api.auth.phone.views import PhoneNumberAvailableView, PhoneNumberValidateView

urlpatterns = [
    path("available/", PhoneNumberAvailableView.as_view()),
    path("validate/", PhoneNumberValidateView.as_view()),
]
