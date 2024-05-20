from django.urls import path

from api.movie.views import (
    MovieListCreateView,
    MovieRetrieveUpdateDestroyView,
)

urlpatterns = [
    path("", MovieListCreateView.as_view()),
    path("<uuid:uuid>/", MovieRetrieveUpdateDestroyView.as_view(lookup_field="uuid")),
]