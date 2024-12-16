import sentry_sdk

from project.settings.environment import ENV, VERSION

# Sentry
# https://docs.sentry.io/platforms/python/django/

try:
    from sentry_sdk.integrations.celery import CeleryIntegration
    from sentry_sdk.integrations.django import DjangoIntegration
    from sentry_sdk.integrations.logging import LoggingIntegration
    from sentry_sdk.integrations.redis import RedisIntegration

    sentry_sdk.init(
        dsn=ENV.str("SENTRY_DNS", default=None),
        environment=ENV.str("ENVIRONMENT", default="undefined"),
        integrations=[
            DjangoIntegration(),
            LoggingIntegration(),
            CeleryIntegration(),
            RedisIntegration(),
        ],
        release=VERSION,
        traces_sample_rate=ENV.float("SENTRY_TRACES_SAMPLE_RATE", default=1.0),
        send_default_pii=True,
    )
except sentry_sdk.utils.BadDsn:
    pass
