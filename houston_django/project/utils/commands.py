import inspect
import os
from abc import ABC
from functools import wraps
from timeit import default_timer as timer

from django.core.management import base


class BaseCommand(ABC, base.BaseCommand):
    @property
    def command_name(self):
        filename = inspect.getfile(self.__class__)
        return os.path.splitext(os.path.basename(filename))[0]

    def log_message(self, message):
        self.stdout.write(message)

    def log_success(self, message):
        self.stdout.write(self.style.SUCCESS(f"[SUCCESS] {message}"))

    def log_error(self, message):
        self.stdout.write(self.style.ERROR(f"[ERROR] {message}"))

    def log_warning(self, message):
        self.stdout.write(self.style.WARNING(f"[WARNING] {message}"))

    def annotate_result(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            result = None
            try:
                start = timer()
                result = f(*args, **kwargs)
                end = timer()
            except Exception as e:
                args[0].log_error(getattr(e, "message", repr(e)))
            else:
                args[0].log_success(
                    f"{args[0].command_name}: {float(format(end - start, '.5f'))}s"
                )
            finally:
                return result

        return wrapper

    class Meta:
        abstract = True
