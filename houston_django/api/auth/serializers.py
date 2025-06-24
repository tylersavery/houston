from django.contrib.auth import password_validation
from django.core.exceptions import ValidationError
from rest_framework import serializers
from api.user.serializers import UserSerializer
from access.models import User
from connect.email.tasks import send_email_confirmation_code


class RegisterAccountSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        try:
            password_validation.validate_password(validated_data.get("password"))
        except ValidationError as e:
            raise serializers.ValidationError({"password": e.messages})

        user = User.objects.create_user(**validated_data)

        send_email_confirmation_code.apply_async(args=[user.pk])

        return user

    def to_representation(self, instance):
        serializer = UserSerializer(instance)
        return serializer.data

    class Meta:
        model = User
        fields = [
            "email",
            "password",
            "username",
        ]
