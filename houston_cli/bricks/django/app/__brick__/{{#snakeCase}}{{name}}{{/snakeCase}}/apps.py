from django.apps import AppConfig


class {{#pascalCase}}{{name}}{{/pascalCase}}Config(AppConfig):
    name = "{{#snakeCase}}{{name}}{{/snakeCase}}"

    def ready(self):
        import {{#snakeCase}}{{name}}{{/snakeCase}}.signals  # noqa
