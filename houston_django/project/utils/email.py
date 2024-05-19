from django.contrib.auth import get_user_model
from django.core import exceptions, validators

User = get_user_model()


def is_email_available(email):
    try:
        User.objects.get(email__iexact=email)
    except User.DoesNotExist:
        return True
    return False


def is_email_valid(email):
    email_validator = validators.EmailValidator()
    try:
        email_validator(email)
    except (TypeError, exceptions.ValidationError):
        return False
    return True
