from rest_framework import serializers


class EmailAvailableSerializer(serializers.Serializer):
    email = serializers.EmailField()


class EmailValidateSerializer(serializers.Serializer):
    email = serializers.EmailField()
