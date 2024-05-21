from django.urls import path

from api.movie.views import (
    MovieListCreateView,
    MovieRetrieveUpdateDestroyView,
)

urlpatterns = [
    path("", MovieListCreateView.as_view()),
    path("<int:pk>/", MovieRetrieveUpdateDestroyView.as_view()),
]