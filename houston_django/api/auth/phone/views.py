from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from api.auth.phone.serializers import (
    PhoneNumberAvailableSerializer,
    PhoneNumberValidateSerializer,
)
from api.permissions import AllowAny
from project.utils.phone import is_phone_number_available


class PhoneNumberAvailableView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = PhoneNumberAvailableSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        is_available = is_phone_number_available(serializer.validated_data.get("email"))
        return Response({"is_available": is_available}, status.HTTP_200_OK)


class PhoneNumberValidateView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = PhoneNumberValidateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        is_valid = serializer.is_valid(raise_exception=False)
        return Response({"is_valid": is_valid}, status.HTTP_200_OK)
