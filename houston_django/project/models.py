from django.db import models
from django.utils.translation import gettext_lazy as _

from project.utils.uuid import get_uuid
from project.validators import TypeValidator


class AbstractModel(models.Model):
    uuid = models.UUIDField(
        _("UUID"),
        default=get_uuid,
        unique=True,
        editable=False,
        db_index=True,
    )
    metadata = models.JSONField(
        _("Metadata"),
        default=dict,
        blank=True,
        null=True,
        validators=[TypeValidator(dict)],
    )
    created_at = models.DateTimeField(_("Created At"), auto_now_add=True)
    updated_at = models.DateTimeField(_("Updated At"), auto_now=True)

    @classmethod
    def get_field(cls, field_name):
        return cls._meta.get_field(field_name)

    def silent_save(self, *fields):
        cls = type(self)
        if hasattr(cls, "_default_manager"):
            cls._default_manager.filter(pk=self.pk).update(
                **{
                    field: getattr(self, field)
                    for field in fields
                    if hasattr(self, field)
                }
            )

    class Meta:
        abstract = True
        ordering = ["-created_at"]


class ArrayLength(models.Func):
    function = "CARDINALITY"
