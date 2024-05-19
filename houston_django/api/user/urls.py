from django.urls import path

from api.user.views import (
    UserMeRetrieveUpdateView,
    UserRetrieveView,
)

urlpatterns = [
    path("me/", UserMeRetrieveUpdateView.as_view()),
    path("<uuid:uuid>/", UserRetrieveView.as_view(lookup_field="uuid")),
]
