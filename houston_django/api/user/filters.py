from django.contrib.auth import get_user_model

from api import filters

User = get_user_model()


class UserFilter(filters.FilterSet):
    class Meta:
        model = User
        fields = []
