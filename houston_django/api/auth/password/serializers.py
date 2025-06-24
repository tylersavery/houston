from rest_framework import serializers


class RequestPasswordResetSerializer(serializers.Serializer):
    email = serializers.EmailField()


class CompletePasswordResetSerializer(serializers.Serializer):
    email = serializers.EmailField()
    verification_code = serializers.CharField()
    new_password = serializers.CharField()
