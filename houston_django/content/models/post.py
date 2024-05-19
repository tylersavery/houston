from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.postgres.fields import ArrayField
from django.core.validators import RegexValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

from project.models import AbstractModel, ArrayLength

User = get_user_model()


class PostManager(models.Manager):
    def available(self):
        return super().filter(is_deleted=False, owner__is_active=True)

    def published(self):
        return self.available().filter(is_published=True)

    def published_listed(self):
        return self.published().filter(is_unlisted=False)

    def get_queryset(self):
        return super().get_queryset().annotate(num_assets=ArrayLength("assets"))


class Post(AbstractModel):

    title = models.CharField(_("Title"), max_length=128)
    body = models.TextField(blank=True, null=True)

    owner = models.ForeignKey(
        User,
        verbose_name=_("Owner"),
        related_name="posts",
        on_delete=models.CASCADE,
        db_index=True,
    )
    assets = ArrayField(
        models.URLField(max_length=256),
        verbose_name=_("Assets"),
        default=list,
        blank=True,
    )
    is_deleted = models.BooleanField(_("Deleted"), default=False)
    is_unlisted = models.BooleanField(_("Unlisted"), default=False)
    is_published = models.BooleanField(_("Published"), default=False)

    objects = PostManager()

    def __str__(self):
        return str(self.title)

    class Meta(AbstractModel.Meta):
        verbose_name = _("Post")
        verbose_name_plural = _("Posts")
