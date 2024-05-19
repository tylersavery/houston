from django.contrib.auth import get_user_model
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework import status
from rest_framework.response import Response

from api.permissions import IsAuthenticated
from api.user.filters import UserFilter
from api.user.querysets import ALL_USERS_QUERYSET
from api.user.serializers import (
    UserPublicSerializer,
    UserSerializer,
)

User = get_user_model()


class UserAPIView(GenericAPIView):
    queryset = ALL_USERS_QUERYSET
    serializer_class = UserPublicSerializer
    permission_classes = [IsAuthenticated]
    filterset_class = UserFilter

    search_fields = ["name"]
    ordering_fields = ["name", "created_at"]
    ordering = ["-created_at"]


class UserRetrieveView(RetrieveModelMixin, UserAPIView):
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)


class UserMeRetrieveUpdateView(RetrieveModelMixin, UpdateModelMixin, UserAPIView):
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)
