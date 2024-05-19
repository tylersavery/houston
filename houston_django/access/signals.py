from django.contrib.auth import get_user_model
from django.db.models.signals import pre_save
from django.dispatch import receiver


User = get_user_model()


@receiver(pre_save, sender=User)
def pre_save_user(sender, instance, **kwargs):
    instance.is_setup = bool(instance.name)
