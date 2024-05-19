from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

from connect.sms.client import send_sms
from project.celery import app

User = get_user_model()


@app.task()
def send_sms_to_user(user_pk, message: str):
    user = User.objects.get(pk=user_pk)
    send_sms(user, message)
