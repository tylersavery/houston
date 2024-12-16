import os

from project.settings.environment import BASE_DIR

# Static files
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_ROOT = os.path.join(BASE_DIR, "static")
STATIC_URL = "/static/"

STATICFILES_DIRS = []
STATICFILES_STORAGE = "whitenoise.storage.CompressedStaticFilesStorage"
STATICFILES_FINDERS = [
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
]

# django-storages
# https://django-storages.readthedocs.io/

DEFAULT_FILE_STORAGE = "storages.backends.s3boto3.S3Boto3Storage"
