from django.db.models import EmailField, CharField


class CIFieldMixin:
    def to_python(self, value):
        value = super().to_python(value)
        return value.lower() if isinstance(value, str) else value


class CICharField(CIFieldMixin, CharField):
    pass


class CIEmailField(CIFieldMixin, EmailField):
    pass
