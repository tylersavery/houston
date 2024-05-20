from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers


class PhoneNumberAvailableSerializer(serializers.Serializer):
    number = PhoneNumberField()


class PhoneNumberValidateSerializer(serializers.Serializer):
    number = PhoneNumberField()
