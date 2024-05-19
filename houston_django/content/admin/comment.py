from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from admin.models import ModelAdmin
from content.models import Comment


@admin.register(Comment)
class CommentAdmin(ModelAdmin):
    search_fields = ["owner__number", "owner__name", "owner__email", "post__title"]
    readonly_fields = [
        "uuid",
        "created_at",
        "updated_at",
    ]
    autocomplete_fields = ["owner", "post"]

    list_display = [
        "post",
        "owner",
        "parent",
        "created_at",
    ]
    list_filter = [
        AutocompleteFilterFactory(_("Owner"), "owner"),
        AutocompleteFilterFactory(_("Post"), "post"),
    ]

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "uuid",
                    "parent",
                    "post",
                    "body",
                    "owner",
                ]
            },
        ),
        (
            _("Dates"),
            {
                "fields": [
                    "created_at",
                    "updated_at",
                ]
            },
        ),
        (
            _("Data"),
            {
                "fields": [
                    "metadata",
                ]
            },
        ),
    )

    class Media:
        pass
