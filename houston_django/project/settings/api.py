from project.settings.environment import ENV

API_ENABLED = ENV.bool("API_ENABLED", default=True)
API_THROTTLE_ENABLED = ENV.bool("API_THROTTLE_ENABLED", default=True)
API_DEFAULT_PAGE_SIZE = ENV.int("API_DEFAULT_PAGE_SIZE", default=10)
API_MAX_PAGE_SIZE = ENV.int("API_MAX_PAGE_SIZE", default=100)

# Django REST Framework
# https://www.django-rest-framework.org/

REST_USE_JWT = True

REST_FRAMEWORK = {
    "DEFAULT_RENDERER_CLASSES": ["rest_framework.renderers.JSONRenderer"],
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "rest_framework_simplejwt.authentication.JWTAuthentication",
        "rest_framework.authentication.BasicAuthentication",
    ],
    "DEFAULT_FILTER_BACKENDS": [
        "django_filters.rest_framework.DjangoFilterBackend",
        "api.filters.ReversibleOrderingFilter",
        "rest_framework.filters.SearchFilter",
    ],
    "DEFAULT_PAGINATION_CLASS": "api.pagination.PageNumberPagination",
    "DEFAULT_THROTTLE_CLASSES": [
        "api.throttling.AnonRateThrottle",
        "api.throttling.UserRateThrottle",
    ],
    "DEFAULT_THROTTLE_RATES": {
        "anon": ENV.str("API_THROTTLE_RATE_ANON", default="60/min"),
        "user": ENV.str("API_THROTTLE_RATE_USER", default="60/min"),
    },
    "URL_FORMAT_OVERRIDE": None,
    "COERCE_DECIMAL_TO_STRING": False,
}
