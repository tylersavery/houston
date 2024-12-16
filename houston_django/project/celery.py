import os

from celery import Celery

from project import __name__

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project.settings")
app = Celery(__name__)
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()
