from rest_framework import serializers


class AssetCreateSerializer(serializers.Serializer):
    path = serializers.CharField()
    content_type = serializers.CharField()
