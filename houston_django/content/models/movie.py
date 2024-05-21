from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth import get_user_model

from project.models import AbstractModel

User = get_user_model()

class MovieManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()


class Movie(AbstractModel):

    
    title = models.CharField(_("Title"), max_length=100,)
    year = models.IntegerField(_("Year"), )
    image_url = models.URLField(_("Image Url"), blank=True,)
    
    owner = models.ForeignKey("access.User", verbose_name=_("Owner"), on_delete=models.CASCADE,)
    

    class Meta(AbstractModel.Meta):
        verbose_name = _("Movie")
        verbose_name_plural = _("Movies")