from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import Group
from django.contrib.auth.forms import UserChangeForm
from django.utils.translation import gettext_lazy as _

from admin.mixins import OverridesMixin


User = get_user_model()

admin.site.unregister(Group)


class UserAdminForm(UserChangeForm):
    class Meta:
        model = User
        fields = "__all__"


@admin.register(User)
class UserAdmin(OverridesMixin, BaseUserAdmin):
    form = UserAdminForm
    save_on_top = True

    autocomplete_fields = []
    search_fields = ["number", "name", "email"]
    readonly_fields = ["id", "is_setup", "created_at", "updated_at"]

    list_display = [
        "email",
        "username",
        "name",
        "number",
        "is_active",
        "is_setup",
        "is_admin",
        "created_at",
    ]
    list_filter = [
        "is_active",
        "is_setup",
        "is_admin",
        "created_at",
    ]
    filter_horizontal = []

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    add_fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "email",
                    "username",
                    "name",
                    "number",
                    "avatar",
                    "bio",
                    "password1",
                    "password2",
                ]
            },
        ),
        (
            _("Access"),
            {"fields": ["is_active", "is_admin"]},
        ),
        (_("Data"), {"fields": ["metadata"]}),
    )

    fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "id",
                    "email",
                    "username",
                    "name",
                    "number",
                    "avatar",
                    "bio",
                ]
            },
        ),
        (
            _("Access"),
            {
                "fields": [
                    "is_setup",
                    "is_active",
                    "is_admin",
                    "password",
                ]
            },
        ),
        (_("Data"), {"fields": ["metadata"]}),
        (_("Dates"), {"fields": ["created_at", "updated_at"]}),
    )

    class Media:
        pass
