from admin_auto_filters.filters import AutocompleteFilterFactory
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from admin.models import ModelAdmin
from {{#snakeCase}}{{appName}}{{/snakeCase}}.models import {{#pascalCase}}{{name}}{{/pascalCase}}


@admin.register({{#pascalCase}}{{name}}{{/pascalCase}})
class {{#pascalCase}}{{name}}{{/pascalCase}}Admin(ModelAdmin):
    search_fields = []
    readonly_fields = []
    autocomplete_fields = []
    list_display = ["id", "uuid", "created_at"]
    list_filter = []
    date_hierarchy = "created_at"
    ordering = ["-created_at"]
