from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    DestroyModelMixin,
)

from api.comment.querysets import ALL_COMMENTS_QUERYSET
from api.comment.serializers import CommentSerializer
from api.permissions import IsOwner, IsCommentPostOwner


class CommentDestroyView(DestroyModelMixin, GenericAPIView):
    serializer_class = CommentSerializer
    permission_classes = [IsOwner | IsCommentPostOwner]
    queryset = ALL_COMMENTS_QUERYSET

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)
