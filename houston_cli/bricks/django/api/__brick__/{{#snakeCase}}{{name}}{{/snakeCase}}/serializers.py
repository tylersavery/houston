from rest_framework import serializers

from {{#snakeCase}}{{appName}}{{/snakeCase}}.models import {{#pascalCase}}{{name}}{{/pascalCase}}


class {{#pascalCase}}{{name}}{{/pascalCase}}Serializer(serializers.ModelSerializer):

    class Meta:
        model = {{#pascalCase}}{{name}}{{/pascalCase}}
        fields = [
            "id",
            "uuid",
        ]

        read_only_fields = [
            "id",
            "uuid",
        ]
