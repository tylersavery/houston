from rest_framework import serializers


class TokenCreateSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()


class TokenRefreshSerializer(serializers.Serializer):
    refresh = serializers.CharField(allow_blank=False, trim_whitespace=True)
