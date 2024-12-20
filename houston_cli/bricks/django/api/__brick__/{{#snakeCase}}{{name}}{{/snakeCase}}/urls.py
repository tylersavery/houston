from django.urls import path

from api.{{#snakeCase}}{{name}}{{/snakeCase}}.views import (
    {{#pascalCase}}{{name}}{{/pascalCase}}ListCreateView,
    {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUpdateDestroyView,
)

urlpatterns = [
    path("", {{#pascalCase}}{{name}}{{/pascalCase}}ListCreateView.as_view()),
    path("<int:pk>/", {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUpdateDestroyView.as_view()),
]