from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    DestroyModelMixin,
    ListModelMixin,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)

from api.{{#snakeCase}}{{name}}{{/snakeCase}}.filters import {{#pascalCase}}{{name}}{{/pascalCase}}Filter
from api.{{#snakeCase}}{{name}}{{/snakeCase}}.querysets import ALL_{{#upperCase}}{{namePlural}}{{/upperCase}}_QUERYSET
from api.{{#snakeCase}}{{name}}{{/snakeCase}}.serializers import {{#pascalCase}}{{name}}{{/pascalCase}}Serializer
from api.permissions import IsAuthenticated, IsOwnerOrReadOnly


class {{#pascalCase}}{{name}}{{/pascalCase}}APIView(GenericAPIView):
    queryset = ALL_{{#upperCase}}{{namePlural}}{{/upperCase}}_QUERYSET
    serializer_class = {{#pascalCase}}{{name}}{{/pascalCase}}Serializer
    permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
    filterset_class = {{#pascalCase}}{{name}}{{/pascalCase}}Filter

    search_fields = []
    ordering_fields = ["created_at"]
    ordering = ["-created_at"]

    def get_queryset(self):
        return super().get_queryset()
    


class {{#pascalCase}}{{name}}{{/pascalCase}}ListCreateView(ListModelMixin, CreateModelMixin, {{#pascalCase}}{{name}}{{/pascalCase}}APIView):
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUpdateDestroyView(
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, {{#pascalCase}}{{name}}{{/pascalCase}}APIView
):
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

