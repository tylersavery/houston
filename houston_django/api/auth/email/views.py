from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from api.auth.email.serializers import EmailAvailableSerializer, EmailValidateSerializer
from api.permissions import AllowAny
from project.utils.email import is_email_available


class EmailAvailableView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = EmailAvailableSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        is_available = is_email_available(serializer.validated_data.get("email"))
        return Response({"is_available": is_available}, status.HTTP_200_OK)


class EmailValidateView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = EmailValidateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        is_valid = serializer.is_valid(raise_exception=False)
        return Response({"is_valid": is_valid}, status.HTTP_200_OK)
