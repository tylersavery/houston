from django.contrib.postgres.fields import ArrayField
from django.db.models import JSONField

from admin.widgets import ArrayWidget, JSONWidget


class AddFieldsetsMixin:
    def get_fieldsets(self, request, obj=None):
        if not obj and hasattr(self, "add_fieldsets") and self.add_fieldsets:
            return self.add_fieldsets
        return super().get_fieldsets(request, obj)


class OverridesMixin:
    formfield_overrides = {
        ArrayField: {"widget": ArrayWidget},
        JSONField: {"widget": JSONWidget},
    }
