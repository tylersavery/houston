from django.conf import settings
from twilio.rest import Client

client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)


def send_sms(user, body):
    return client.messages.create(
        to=str(user.number), from_=settings.TWILIO_FROM_NUMBER, body=body
    )
