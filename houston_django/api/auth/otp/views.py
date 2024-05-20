from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from rest_framework import status
from rest_framework.response import Response
from rest_framework_simplejwt import views as jwt_views
from rest_framework_simplejwt.tokens import RefreshToken

from access.models import OneTimePassword
from api import exceptions
from api.auth.otp.serializers import (
    OTPRequestEmailSerializer,
    OTPRequestPhoneSerializer,
    OTPEmailValidateSerializer,
    OTPPhoneValidateSerializer,
)
from api.permissions import AllowAny
from api.throttling import PathRateThrottle
from connect.sms.tasks import send_otp_sms
from connect.email.tasks import send_otp_email

User = get_user_model()


class OTPRequestEmailView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPRequestEmailSerializer
    throttle_classes = [PathRateThrottle]
    throttle_scope = "otp"

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        try:
            user = User.objects.get(email=serializer.validated_data.get("email"))
        except User.DoesNotExist:
            # Always return 204 to mislead user account number phishing
            return Response(None, status.HTTP_204_NO_CONTENT)

        send_otp_email.apply_async(args=[user.pk])

        return Response(None, status.HTTP_204_NO_CONTENT)


class OTPEmailValidateView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPEmailValidateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        try:
            user = User.objects.get(email=serializer.validated_data.get("email"))
        except User.DoesNotExist:
            raise exceptions.AuthenticationFailed()

        for otp in OneTimePassword.objects.filter(
            user=user, code=serializer.validated_data.get("code")
        ):
            if otp.is_valid:
                try:
                    otp.consume()
                    otp.save()
                except ValidationError:
                    continue

                refresh = RefreshToken.for_user(user)
                return Response(
                    {"access": str(refresh.access_token), "refresh": str(refresh)},
                    status.HTTP_200_OK,
                )

        raise exceptions.AuthenticationFailed()


class OTPRequestPhoneView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPRequestPhoneSerializer
    throttle_classes = [PathRateThrottle]
    throttle_scope = "otp"

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        try:
            user = User.objects.get(number=serializer.validated_data.get("number"))
        except User.DoesNotExist:
            # Always return 204 to mislead user account number phishing
            return Response(None, status.HTTP_204_NO_CONTENT)

        send_otp_sms.apply_async(args=[user.pk])

        return Response(None, status.HTTP_204_NO_CONTENT)


class OTPPhoneValidateView(jwt_views.TokenViewBase):
    permission_classes = [AllowAny]
    serializer_class = OTPPhoneValidateSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        try:
            user = User.objects.get(number=serializer.validated_data.get("number"))
        except User.DoesNotExist:
            raise exceptions.AuthenticationFailed()

        for otp in OneTimePassword.objects.filter(
            user=user, code=serializer.validated_data.get("code")
        ):
            if otp.is_valid:
                try:
                    otp.consume()
                    otp.save()
                except ValidationError:
                    continue

                refresh = RefreshToken.for_user(user)
                return Response(
                    {"access": str(refresh.access_token), "refresh": str(refresh)},
                    status.HTTP_200_OK,
                )

        raise exceptions.AuthenticationFailed()
