from django.contrib.admin import forms
from django.utils.translation import gettext_lazy as _


class AdminAuthenticationForm(forms.AdminAuthenticationForm):
    def __init__(self, request=None, *args, **kwargs):
        super().__init__(request, *args, **kwargs)
        self.fields["username"].label = _("Email")
