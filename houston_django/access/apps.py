from django.apps import AppConfig


class AccessConfig(AppConfig):
    name = "access"

    def ready(self):
        import access.signals  # noqa
