from django.urls import path

from api.post.views import (
    PostListCreateView,
    PostRetrieveUpdateDestroyView,
    PostListMeView,
    PostRetrieveMeView,
    PostCommentListCreateView,
)

urlpatterns = [
    path("", PostListCreateView.as_view()),
    path("<uuid:uuid>/", PostRetrieveUpdateDestroyView.as_view(lookup_field="uuid")),
    path("me/", PostListMeView.as_view()),
    path("me/<uuid:uuid>/", PostRetrieveMeView.as_view(lookup_field="uuid")),
    path("<uuid:uuid>/comment/", PostCommentListCreateView.as_view()),
]
