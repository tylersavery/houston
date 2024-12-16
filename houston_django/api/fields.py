from django.conf import settings
from django.core.validators import RegexValidator
from rest_framework import serializers


class RelatedModelField(serializers.PrimaryKeyRelatedField):
    serializer = None

    def __init__(self, serializer, **kwargs):
        self.serializer = serializer
        super().__init__(**kwargs)

    def use_pk_only_optimization(self):
        return False

    def to_representation(self, obj):
        return self.serializer(obj).data


class URLRegexField(serializers.URLField):
    url_regex = None

    def __init__(self, max_length=256, **kwargs):
        super().__init__(max_length=max_length, **kwargs)
        validator = RegexValidator(
            self.url_regex, message=self.error_messages["invalid"]
        )
        self.validators.append(validator)
