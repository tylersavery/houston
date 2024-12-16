from datetime import timedelta

from django.urls import reverse_lazy

from project.settings.environment import ENV

# Auth
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth

AUTH_USER_MODEL = "access.User"
AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
        "OPTIONS": {"min_length": ENV.int("AUTH_PASSWORD_MIN_LENGTH", default=8)},
    },
]
AUTH_OTP_TIMEOUT = ENV.int("AUTH_OTP_TIMEOUT", default=60)
AUTHENTICATION_BACKENDS = ["access.backends.ModelBackend"]
LOGIN_URL = reverse_lazy("admin:login")

# Simple JWT
# https://django-rest-framework-simplejwt.readthedocs.io

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(
        seconds=ENV.int("AUTH_JWT_ACCESS_TOKEN_TIMEOUT", default=86400)
    ),
    "REFRESH_TOKEN_LIFETIME": timedelta(
        seconds=ENV.int("AUTH_JWT_REFRESH_TOKEN_TIMEOUT", default=604800)
    ),
    "ROTATE_REFRESH_TOKENS": True,
    "SIGNING_KEY": ENV.str("AUTH_JWT_SIGNING_KEY"),
    "USER_ID_FIELD": "uuid",
}

AUTH_TOKEN_TIMEOUT = ENV.int("AUTH_TOKEN_TIMEOUT", default=259200)
AUTH_TOKEN_SECRET = ENV.str("AUTH_TOKEN_SECRET")
