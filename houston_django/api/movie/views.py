from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    DestroyModelMixin,
    ListModelMixin,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)

from api.movie.filters import MovieFilter
from api.movie.querysets import ALL__QUERYSET
from api.movie.serializers import MovieSerializer
from api.permissions import IsAuthenticated, IsOwnerOrReadOnly


class MovieAPIView(GenericAPIView):
    queryset = ALL__QUERYSET
    serializer_class = MovieSerializer
    permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
    filterset_class = MovieFilter

    search_fields = []
    ordering_fields = ["created_at"]
    ordering = ["-created_at"]

    def get_queryset(self):
        return super().get_queryset()
    


class MovieListCreateView(ListModelMixin, CreateModelMixin, MovieAPIView):
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class MovieRetrieveUpdateDestroyView(
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, MovieAPIView
):
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

