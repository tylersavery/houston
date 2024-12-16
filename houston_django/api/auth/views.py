from rest_framework.generics import GenericAPIView
from rest_framework.mixins import CreateModelMixin

from api.auth.serializers import RegisterAccountSerializer
from api.permissions import AllowAny


class RegisterAccountView(CreateModelMixin, GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = RegisterAccountSerializer

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
