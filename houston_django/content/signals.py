from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver

from content.models import Post


@receiver(post_save, sender=Post)
def post_save_post(sender, instance, **kwargs):
    pass


@receiver(pre_save, sender=Post)
def pre_save_post(sender, instance, **kwargs):
    pass
