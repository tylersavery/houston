from functools import wraps

from django.conf import settings
from django.views.decorators.cache import cache_page


def cache_request(view_func=None, timeout=settings.CACHE_TIMEOUT_DEFAULT):
    def decorate(f):
        @wraps(f)
        def wrapper(request, *args, **kwargs):
            if settings.CACHE_ENABLED:
                return cache_page(timeout)(f)(request, *args, **kwargs)
            else:
                return f(request, *args, **kwargs)

        return wrapper

    return decorate(view_func) if view_func else decorate
