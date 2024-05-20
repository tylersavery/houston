from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _

from project.models import AbstractModel



class MovieManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()


class Movie(AbstractModel):

    
    title = models.CharField(_("Title"), max_length=100,)
    year = models.IntegerField(_("Year"), )
    image_url = models.URLField(_("Image Url"), )
    
    

    class Meta(AbstractModel.Meta):
        verbose_name = _("Movie")
        verbose_name_plural = _("Movies")