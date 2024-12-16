from django.conf import settings
from django.core.mail import send_mail
from django.utils.html import strip_tags


def send_email(subject, body, recipients, from_email=settings.EMAIL_FROM):

    if not settings.EMAIL_ENABLED:
        print("Email not enabled for this environment")
        return

    if isinstance(recipients, str):
        recipients = (recipients,)

    recipients = list(set(recipients))

    if len(recipients < 1):
        return

    send_mail(subject, strip_tags(body), from_email, recipients, html_message=body)
