from admin_interface.models import Theme
from django.conf import settings
from django.contrib import admin

from admin.forms import AdminAuthenticationForm

if not settings.ADMIN_THEME_EDITABLE:
    admin.site.unregister(Theme)

admin.site.login_form = AdminAuthenticationForm
