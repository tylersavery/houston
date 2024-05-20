from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

from access.models import OneTimePassword
from connect.sms.client import send_sms
from project.celery import app

User = get_user_model()


@app.task()
def send_otp_sms(user_pk):
    user = User.objects.get(pk=user_pk)
    otp = OneTimePassword.objects.create(user=user)
    send_sms(
        user,
        _("Verification Code: %(code)s") % {"code": otp.code},
    )
