from django.conf import settings
from rest_framework import throttling


class BypassThrottleMixin:
    def allow_request(self, request, view):
        if not settings.API_THROTTLE_ENABLED:
            return True
        return super().allow_request(request, view)


class PathRateThrottle(BypassThrottleMixin, throttling.ScopedRateThrottle):
    cache_format = "throttle_%(scope)s_%(ident)s_%(path)s"

    @staticmethod
    def get_path(request):
        return request.META.get("PATH_INFO")

    def get_cache_key(self, request, view):
        if request.user.is_authenticated:
            ident = request.user.pk
        else:
            ident = self.get_ident(request)

        return self.cache_format % {
            "scope": self.scope,
            "ident": ident,
            "path": self.get_path(request),
        }


class AnonRateThrottle(BypassThrottleMixin, throttling.AnonRateThrottle):
    pass


class UserRateThrottle(BypassThrottleMixin, throttling.UserRateThrottle):
    pass
