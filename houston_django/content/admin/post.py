from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from admin.models import ModelAdmin
from content.models import Post


@admin.register(Post)
class PostAdmin(ModelAdmin):
    search_fields = ["owner__number", "owner__name", "owner__email"]
    readonly_fields = [
        "uuid",
        "num_assets",
        "created_at",
        "updated_at",
    ]
    autocomplete_fields = ["owner"]

    list_display = [
        "title",
        "owner",
        "num_assets",
        "is_published",
        "is_unlisted",
        "is_deleted",
        "created_at",
    ]
    list_filter = [
        AutocompleteFilterFactory(_("Owner"), "owner"),
        "is_published",
        "is_unlisted",
        "is_deleted",
    ]

    def num_assets(self, obj):
        return obj.num_assets

    num_assets.admin_order_field = "num_assets"
    num_assets.short_description = _("Assets")

    date_hierarchy = "created_at"
    ordering = ["-created_at"]

    fieldsets = (
        (
            _("Details"),
            {
                "fields": [
                    "uuid",
                    "title",
                    "body",
                    "owner",
                    "assets",
                ]
            },
        ),
        (
            _("Flags"),
            {
                "fields": [
                    "is_published",
                    "is_unlisted",
                    "is_deleted",
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
                    "num_assets",
                    "metadata",
                ]
            },
        ),
    )

    class Media:
        pass
