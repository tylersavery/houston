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
AUTHENTICATION_BACKENDS = [
    "access.backends.ModelBackend",
    "allauth.account.auth_backends.AuthenticationBackend",
]
LOGIN_URL = reverse_lazy("admin:login")

# django-allauth
# https://docs.allauth.org/en/latest/account/configuration.html


ACCOUNT_EMAIL_REQUIRED = True
ACCOUNT_AUTHENTICATION_METHOD = "email"
ACCOUNT_EMAIL_VERIFICATION = "none"  # "none", "optional", "manditory"
ACCOUNT_CONFIRM_EMAIL_ON_GET = True

HEADLESS_ONLY = ENV.bool("AUTH_HEADLESS_ONLY", default=True)

HEADLESS_FRONTEND_URLS = {
    "account_confirm_email": ENV.str(
        "AUTH_CONFIRM_EMAIL_URL",
    ),
    "account_reset_password_from_key": ENV.str("AUTH_RESET_PASSWORD_URL"),
    "account_signup": ENV.str("AUTH_REGISTER_URL"),
}

# EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
