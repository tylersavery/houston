from django.conf import settings
from django.contrib.auth import get_user_model
from django.template.loader import render_to_string
from django.utils.translation import gettext_lazy as _

from project.celery import app
from .client import send_email
from access.models import OneTimePassword


User = get_user_model()


def build_context(**context):
    return {
        **{
            "site_domain": settings.EMAIL_CONTEXT_SITE_DOMAIN,
            "landing_site_domain": settings.EMAIL_CONTEXT_LANDING_SITE_DOMAIN,
            "support_email": settings.EMAIL_CONTEXT_SUPPORT_ADDRESS,
        },
        **context,
    }


@app.task()
def send_otp_email(user_pk: int):
    user = User.objects.get(pk=user_pk)
    otp = OneTimePassword.objects.create(user=user)

    subject = _("Verification Code")
    body = (_("Here is your verification code: %(code)s") % {"code": otp.code},)

    context = build_context(user=user, data={"code": otp.code})

    body = render_to_string("email/otp.html", context)

    send_email(subject, body, user.email)
