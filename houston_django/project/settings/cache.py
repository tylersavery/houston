from project.settings.environment import ENV

# Redis
# https://redis.io/documentation

REDIS_URL = ENV.str("REDIS_URL")

# Cache
# https://docs.djangoproject.com/en/3.1/ref/settings/#caches

CACHE_ENABLED = ENV.bool("CACHE_ENABLED", default=True)
CACHE_TIMEOUT_SHORT = ENV.int("CACHE_TIMEOUT_SHORT", default=10)
CACHE_TIMEOUT_DEFAULT = ENV.int("CACHE_TIMEOUT_DEFAULT", default=300)
CACHE_TIMEOUT_LONG = ENV.int("CACHE_TIMEOUT_LONG", default=3600)

CACHES = {
    cache: {
        "BACKEND": "django.core.cache.backends.redis.RedisCache",
        "KEY_PREFIX": ENV.str("CACHE_KEY_PREFIX", default=""),
        "TIMEOUT": CACHE_TIMEOUT_DEFAULT,
        "LOCATION": f"{REDIS_URL}/{index}",
        "VERSION": ENV.int("CACHE_VERSION", default=1),
    }
    for (index, cache) in enumerate(["default", "session"])
}
