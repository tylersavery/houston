from project.settings.environment import ENV

EMAIL_ENABLED = ENV.bool("EMAIL_ENABLED", default=False)
EMAIL_FROM = ENV.str("EMAIL_FROM")
DEFAULT_FROM_EMAIL = EMAIL_FROM
EMAIL_HOST = ENV.str("EMAIL_HOST")
EMAIL_HOST_USER = ENV.str("EMAIL_HOST_USER")
EMAIL_HOST_PASSWORD = ENV.str("EMAIL_HOST_PASSWORD")
EMAIL_PORT = ENV.int("EMAIL_PORT")
EMAIL_USE_TLS = ENV.bool("EMAIL_USE_TLS", default=True)
EMAIL_CONTEXT_SITE_DOMAIN = ENV.str("EMAIL_CONTEXT_SITE_DOMAIN", default=None)
EMAIL_CONTEXT_LANDING_SITE_DOMAIN = ENV.str(
    "EMAIL_CONTEXT_LANDING_SITE_DOMAIN", default=None
)
EMAIL_CONTEXT_SUPPORT_ADDRESS = ENV.str("EMAIL_CONTEXT_SUPPORT_ADDRESS", default=None)
