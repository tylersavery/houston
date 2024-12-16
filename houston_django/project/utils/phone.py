from django.contrib.auth import get_user_model
from django.core import exceptions
from phonenumber_field.validators import validate_international_phonenumber

User = get_user_model()


def is_phone_number_available(number):
    try:
        User.objects.get(number__iexact=number)
    except User.DoesNotExist:
        return True
    return False


def is_phone_number_valid(number):
    try:
        validate_international_phonenumber(number)
    except (TypeError, exceptions.ValidationError):
        return False
    return True
