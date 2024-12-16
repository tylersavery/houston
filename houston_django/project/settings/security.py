from project.settings.environment import ENV

# Security
# https://docs.djangoproject.com/en/3.1/ref/settings/#secret-key

SECRET_KEY = ENV.str("SECRET_KEY")
SECURE_SSL_REDIRECT = ENV.bool("SECURE_SSL_REDIRECT", default=True)
X_FRAME_OPTIONS = "SAMEORIGIN"
