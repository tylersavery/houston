from project.settings.environment import ENV

# Admin
# https://docs.djangoproject.com/en/3.1/ref/contrib/admin/

ADMIN_ENABLED = ENV.bool("ADMIN_ENABLED", default=True)
ADMIN_URL_PATH = ENV.str("ADMIN_URL_PATH", default="manage/")

# Ace
# https://ace.c9.io/
ADMIN_ACE_THEME = ENV.str("ADMIN_ACE_THEME", default="chrome")

# django-admin-interface
# https://github.com/fabiocaccamo/django-admin-interface

ADMIN_THEME_EDITABLE = ENV.bool("ADMIN_THEME_EDITABLE", default=False)
