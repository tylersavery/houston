from django.contrib.auth import get_user_model


def is_username_available(username):
    return not get_user_model().objects.filter(username__iexact=username).exists()
