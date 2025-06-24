from rest_framework import serializers


class EmailAvailableSerializer(serializers.Serializer):
    email = serializers.EmailField()


class EmailValidateSerializer(serializers.Serializer):
    email = serializers.EmailField()


class ConfirmEmailSerializer(serializers.Serializer):
    email = serializers.EmailField()
    verification_code = serializers.CharField()
