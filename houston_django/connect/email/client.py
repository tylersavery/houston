from django.conf import settings
from django.core.mail import send_mail
from django.utils.html import strip_tags


def send_email(subject, body, recipients, from_email=settings.EMAIL_FROM):

    if isinstance(recipients, str):
        recipients = (recipients,)

    recipients = list(set(recipients))

    if len(recipients) < 1:
        print("No recipients to send email to")
        return

    if settings.EMAIL_DEBUG_MODE:

        print("--------------------------------")
        print("*** EMAIL DEBUG MODE ENABLED ***")
        print("***  No emails will be sent  ***")
        print("--------------------------------")

        print(f"Subject: {subject}")
        print(f"Recipients: {','.join(recipients)}")
        print(f"From: {from_email}")
        print(f"Body:\n\n{body}")

        print("--------")

        return

    if not settings.EMAIL_ENABLED:
        print("Email not enabled for this environment")
        return

    send_mail(subject, strip_tags(body), from_email, recipients, html_message=body)
