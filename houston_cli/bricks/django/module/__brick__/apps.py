from django.apps import AppConfig


class {{#pascalCase}}{{appName}}{{/pascalCase}}Config(AppConfig):
    name = "{{#snakeCase}}{{appName}}{{/snakeCase}}"

    def ready(self):
        import {{#snakeCase}}{{appName}}{{/snakeCase}}.signals  # noqa
