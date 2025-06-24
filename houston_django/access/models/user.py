from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.contenttypes.models import ContentType
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from phonenumber_field.modelfields import PhoneNumberField
from project.validators import TypeValidator

from project.fields import CIEmailField
from project.models import AbstractModel
from project.utils.string import generate_random_digits, split_name, get_random_string
from project.utils.uuid import get_uuid


def get_user_id():
    user_id = ""

    while True:
        user_id = get_random_string(
            "ABCDEFGHJKMNPQRSTUVWXYabcdefghjkmnpqrstuvwxyzZ123456789", 8
        )
        try:
            User.objects.get(user_id=user_id)
        except User.DoesNotExist:
            break
        except Exception as e:
            # if the migrations have never run, we need this:
            user_id = "foobar"
            break

    return user_id


class UserManager(BaseUserManager):
    def _create_user(self, password, **kwargs):

        user = self.model(**kwargs)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, password=None, **kwargs):
        kwargs["is_admin"] = False
        return self._create_user(password, **kwargs)

    def create_superuser(self, password, **kwargs):
        kwargs["is_admin"] = True
        return self._create_user(password, **kwargs)


class User(AbstractModel, AbstractBaseUser):

    user_id = models.CharField(
        _("User ID"),
        default=get_user_id,
        unique=True,
        editable=False,
        db_index=True,
        max_length=8,
    )

    email = CIEmailField(_("Email"), max_length=128, unique=True, db_index=True)
    username = models.CharField(_("Username"), max_length=128, db_index=True)
    password = models.CharField(_("Password"), max_length=128)
    number = PhoneNumberField(
        _("Number"), unique=True, null=True, blank=True, db_index=True
    )

    name = models.CharField(_("Name"), max_length=32, blank=True)
    avatar = models.URLField(
        _("Image"),
        max_length=256,
        blank=True,
    )
    is_active = models.BooleanField(
        _("Active"),
        help_text=_("Designates whether this user can access their account."),
        default=True,
    )
    is_setup = models.BooleanField(
        _("Setup"),
        help_text=_("Designates whether the user requires onboarding."),
        default=False,
    )
    is_admin = models.BooleanField(
        _("Admin"),
        help_text=_("Designates whether the user can log into this admin site."),
        default=False,
    )

    bio = models.TextField(blank=True)

    email_confirmation_code = models.CharField(default=generate_random_digits)
    email_is_confirmed = models.BooleanField(default=False)

    last_login = None

    objects = UserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username"]

    @property
    def first_name(self):
        f, _ = split_name(self.name)
        return f

    @property
    def last_name(self):
        _, l = split_name(self.name)
        return l

    @property
    def is_staff(self):
        return self.is_admin

    @property
    def is_superuser(self):
        return self.is_admin

    def __str__(self):
        return f"{self.username} ({self.email})"

    def has_perm(self, perm, obj=None):
        return self.is_active and self.is_admin

    def has_module_perms(self, app_label):
        return self.is_active and self.is_admin

    def get_all_permissions(self, obj=None):
        return []

    class Meta(AbstractModel.Meta):
        verbose_name = _("User")
        verbose_name_plural = _("Users")
