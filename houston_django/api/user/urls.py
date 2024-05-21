from django.urls import path

from api.user.views import (
    UserMeRetrieveUpdateView,
    UserRetrieveView,
)

urlpatterns = [
    path("me/", UserMeRetrieveUpdateView.as_view()),
    path("<str:user_id>/", UserRetrieveView.as_view(lookup_field="user_id")),
]
