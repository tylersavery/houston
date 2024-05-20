from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from admin.models import ModelAdmin
from .models import Game


@admin.register(Game)
class GameAdmin(ModelAdmin):
    search_fields = []
    readonly_fields = []
    autocomplete_fields = []
    list_display = ["id", "uuid", "created_at"]
    list_filter = []
    date_hierarchy = "created_at"
    ordering = ["-created_at"]
