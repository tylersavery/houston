from django.contrib.auth import backends, get_user_model

from project.utils.email import is_email_valid
from project.utils.phone import is_phone_number_valid

User = get_user_model()


class ModelBackend(backends.ModelBackend):
    def authenticate(
        self, request, number=None, email=None, username=None, password=None, **kwargs
    ):
        if not password:
            return

        if number and is_phone_number_valid(number):
            lookup_field = "number"
            lookup_value = number
        elif email and is_email_valid(email):
            lookup_field = "email"
            lookup_value = email
        elif username and is_phone_number_valid(username):
            lookup_field = "number"
            lookup_value = username
        elif username and is_email_valid(username):
            lookup_field = "email"
            lookup_value = username
        else:
            return

        try:
            user = User.objects.get(**{lookup_field: lookup_value})
        except User.DoesNotExist:
            # Run the default password hasher once to reduce the timing
            # difference between an existing and a nonexistent user (#20760).
            User().set_password(password)
        else:
            if user.check_password(password) and self.user_can_authenticate(user):
                return user
