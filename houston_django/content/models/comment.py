from django.db import models
from django.utils.translation import gettext_lazy as _
from project.models import AbstractModel


class CommentManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()


class Comment(AbstractModel):

    body = models.TextField(_("Body"))

    post = models.ForeignKey(
        "content.Post",
        verbose_name=_("Post"),
        on_delete=models.CASCADE,
    )

    owner = models.ForeignKey(
        "access.User",
        verbose_name=_("Owner"),
        on_delete=models.CASCADE,
    )

    parent = models.ForeignKey(
        "content.Comment",
        verbose_name=_("Parent"),
        on_delete=models.SET_NULL,
        related_name="children",
        null=True,
        blank=True,
    )

    @property
    def post_owner(self):
        return getattr(self.post, "owner", None)

    class Meta(AbstractModel.Meta):
        verbose_name = _("Comment")
        verbose_name_plural = _("Comments")
