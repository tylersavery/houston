from rest_framework import serializers

from {{#snakeCase}}{{appName}}{{/snakeCase}}.models import {{#pascalCase}}{{name}}{{/pascalCase}}


class {{#pascalCase}}{{name}}{{/pascalCase}}Serializer(serializers.ModelSerializer):

    uid = serializers.CharField(source="uuid", required=False)

    class Meta:
        model = {{#pascalCase}}{{name}}{{/pascalCase}}
        fields = [
            "id",
            {{#propertiesForSerializer}}"{{#snakeCase}}{{name}}{{/snakeCase}}",
            {{/propertiesForSerializer}}
        ]

        read_only_fields = [
            "id",
            "uid",
            "created_at",
            {{#readOnlyPropertiesForSerializer}}"{{#snakeCase}}{{name}}{{/snakeCase}}",
            {{/readOnlyPropertiesForSerializer}}
        ]
