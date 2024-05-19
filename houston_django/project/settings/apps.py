# Installed Apps
# https://docs.djangoproject.com/en/3.1/ref/settings/#installed-apps

INSTALLED_APPS = [
    "admin_auto_filters",
    "admin_interface",
    "colorfield",
    "corsheaders",
    "django_ace",
    "django_filters",
    "phonenumber_field",
    "rest_framework",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.messages",
    "django.contrib.sessions",
    "django.contrib.staticfiles",
    "allauth",
    "allauth.account",
    "allauth.headless",
    "access.apps.AccessConfig",
    "admin.apps.AdminConfig",
    "admin.apps.CacheConfig",
    "api.apps.ApiConfig",
    "content.apps.ContentConfig",
    "connect.apps.ConnectConfig",
    #::HOUSTON-INSERT-MODULE::
]
