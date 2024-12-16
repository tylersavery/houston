from corsheaders.defaults import default_headers, default_methods

from project.settings.environment import ENV

# Cross-Origin Resource Sharing
# https://pypi.org/project/django-cors-headers/

CORS_ALLOW_ALL_ORIGINS = ENV.bool("CORS_ALLOW_ALL_ORIGINS", default=False)
CORS_ALLOW_HEADERS = ENV.list("CORS_ALLOW_HEADERS", default=default_headers, cast=str)
CORS_ALLOW_METHODS = ENV.list("CORS_ALLOW_METHODS", default=default_methods, cast=str)
CORS_ALLOWED_ORIGINS = ENV.list("CORS_ALLOWED_ORIGINS", default=[], cast=str)
CORS_ALLOWED_ORIGIN_REGEXES = ENV.list(
    "CORS_ALLOWED_ORIGIN_REGEXES", default=[], cast=str
)
CORS_URLS_REGEX = ENV.str("CORS_URLS_REGEX", default=r"^.*$")
