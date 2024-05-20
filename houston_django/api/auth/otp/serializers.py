from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers


class OTPRequestEmailSerializer(serializers.Serializer):
    email = serializers.EmailField()


class OTPEmailValidateSerializer(serializers.Serializer):
    email = serializers.EmailField()
    code = serializers.CharField()


class OTPRequestPhoneSerializer(serializers.Serializer):
    number = PhoneNumberField()


class OTPPhoneValidateSerializer(serializers.Serializer):
    number = PhoneNumberField()
    code = serializers.CharField()
