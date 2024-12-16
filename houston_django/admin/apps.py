from clearcache.apps import ClearcacheConfig
from django.apps import AppConfig


class AdminConfig(AppConfig):
    name = "admin"
    label = "administration"


class CacheConfig(ClearcacheConfig):
    name = "clearcache"
    verbose_name = "cache"
