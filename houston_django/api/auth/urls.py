from django.urls import include, path

from api.auth.views import RegisterAccountView


urlpatterns = [
    path("email/", include("api.auth.email.urls")),
    path("otp/", include("api.auth.otp.urls")),
    path("phone/", include("api.auth.phone.urls")),
    path("token/", include("api.auth.token.urls")),
    path("register/", RegisterAccountView.as_view()),
]
