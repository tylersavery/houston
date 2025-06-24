from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from project.utils.string import generate_random_digits
from rest_framework_simplejwt.tokens import RefreshToken, TokenError
from api import exceptions

from api.permissions import AllowAny
from api.auth.password.serializers import (
    CompletePasswordResetSerializer,
    RequestPasswordResetSerializer,
)
from access.models import User


class RequestPasswordResetView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = RequestPasswordResetSerializer

    def post(self, request, *args, **kwargs):

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        email = serializer.validated_data.get("email")

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({}, status=status.HTTP_204_NO_CONTENT)

        user.email_confirmation_code = generate_random_digits()
        user.save()

        # TODO: send this in code an email
        print(user.email_confirmation_code)

        return Response({}, status=status.HTTP_204_NO_CONTENT)


class CompletePasswordResetView(GenericAPIView):
    permission_classes = [AllowAny]
    serializer_class = CompletePasswordResetSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        email = serializer.validated_data.get("email")
        verification_code = serializer.validated_data.get("verification_code")
        new_password = serializer.validated_data.get("new_password")

        try:
            user = User.objects.get(
                email=email, email_confirmation_code=verification_code
            )
        except User.DoesNotExist:
            return Response(
                {"confirmed": False, "detail": "Incorrect email/otp code"},
                status.HTTP_400_BAD_REQUEST,
            )

        user.set_password(new_password)
        user.save()

        try:
            refresh = RefreshToken.for_user(user)
        except TokenError:
            raise exceptions.BadRequest(
                {"detail": "Invalid Token", "code": "invalid_token"}
            )

        return Response(
            {"access": str(refresh.access_token), "refresh": str(refresh)},
            status.HTTP_200_OK,
        )
