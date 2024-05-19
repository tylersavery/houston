import json
import re

from django.conf import settings
from django_ace import AceWidget as BaseAceWidget


class AceWidget(BaseAceWidget):
    mode = None

    def __init__(self, *args, **kwargs):
        super().__init__(
            *args,
            mode=self.mode,
            theme=settings.ADMIN_ACE_THEME,
            width="100%",
            height="500px",
            **kwargs
        )


class ArrayWidget(AceWidget):
    mode = "text"

    def render(self, name, value, attrs=None, renderer=None):
        value = ",\n".join(re.sub(r"[\r\n]", "", value).split(","))
        return super().render(name, value, attrs, renderer)


class JSONWidget(AceWidget):
    mode = "json"

    def render(self, name, value, attrs=None, renderer=None):
        try:
            value = json.dumps(json.loads(value), indent=4)
        except json.JSONDecodeError:
            pass
        return super().render(name, value, attrs, renderer)
