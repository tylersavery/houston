from django.urls import path

from api.comment.views import (
    CommentDestroyView,
)

urlpatterns = [
    path("<uuid:uuid>/", CommentDestroyView.as_view(lookup_field="uuid")),
]
