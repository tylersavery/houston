from django.db import models
from django.utils import timezone
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from access.models.user import User
from project.models import AbstractModel
from project.utils.string import get_random_string


OTP_LENGTH = 6


def get_otp_code():
    return get_random_string("0123456789", OTP_LENGTH)


class OneTimePassword(AbstractModel):
    code = models.CharField(
        _("Code"),
        default=get_otp_code,
        max_length=OTP_LENGTH,
        editable=False,
        db_index=True,
    )
    user = models.ForeignKey(
        User, verbose_name=_("User"), on_delete=models.CASCADE, db_index=True
    )
    expires_at = models.DateTimeField(_("Expires At"))
    consumed_at = models.DateTimeField(_("Consumed At"), blank=True, null=True)

    @property
    def is_expired(self):
        return timezone.now() > self.expires_at

    @property
    def is_consumed(self):
        return bool(self.consumed_at)

    @property
    def is_valid(self):
        return self.user.is_active and not self.is_expired and not self.is_consumed

    def consume(self):
        if not self.is_valid:
            raise ValidationError("Cannot consume, OTP is invalid.")
        self.consumed_at = timezone.now()

    def __str__(self):
        return str(self.uuid)

    class Meta(AbstractModel.Meta):
        verbose_name = _("OTP")
        verbose_name_plural = _("OTPs")
