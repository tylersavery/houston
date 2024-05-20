from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _
{{#modelImports}}{{{.}}}
{{/modelImports}}
from project.models import AbstractModel

{{#shouldRegisterUser}}User = get_user_model(){{/shouldRegisterUser}}

class {{#pascalCase}}{{name}}{{/pascalCase}}Manager(models.Manager):
    def get_queryset(self):
        return super().get_queryset()


class {{#pascalCase}}{{name}}{{/pascalCase}}(AbstractModel):

    {{#properties}}{{{djangoModelEntry}}}
    {{/properties}}

    class Meta(AbstractModel.Meta):
        verbose_name = _("{{label}}")
        verbose_name_plural = _("{{labelPlural}}")