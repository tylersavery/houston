from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    DestroyModelMixin,
    ListModelMixin,
    CreateModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)
from rest_framework import status
from rest_framework.response import Response

from content.models import Post
from content.models import Comment
from api import exceptions
from api.post.filters import PostFilter
from api.post.serializers import (
    PostSerializer,
    PostCommentSerializer,
)
from api.permissions import (
    IsAuthenticated,
    IsAuthenticatedOrReadOnly,
    IsOwnerOrReadOnly,
    IsOwner,
)
from api.comment.serializers import CommentSerializer
from api.comment.querysets import ALL_PARENT_COMMENTS_QUERYSET


class PostAPIView(GenericAPIView):
    queryset = Post.objects.available()
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated | IsOwnerOrReadOnly]
    filterset_class = PostFilter

    search_fields = ["owner__name"]
    ordering_fields = ["created_at"]
    ordering = ["-created_at"]

    def get_queryset(self):
        return super().get_queryset().select_related("owner")


class PostListCreateView(ListModelMixin, CreateModelMixin, PostAPIView):
    def get(self, request, *args, **kwargs):
        self.queryset = Post.objects.published_listed()
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class PostRetrieveUpdateDestroyView(
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, PostAPIView
):
    def get(self, request, *args, **kwargs):
        self.queryset = Post.objects.published()
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

    def perform_destroy(self, instance):
        instance.is_deleted = True
        instance.is_published = False
        instance.is_unlisted = True
        instance.save()


class PostListMeView(ListModelMixin, PostAPIView):
    def get_queryset(self):
        return self.queryset.filter(owner=self.request.user)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class PostRetrieveMeView(
    RetrieveModelMixin,
    PostAPIView,
):
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated, IsOwner]
    queryset = Post.objects.available()

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)


class PostCommentListCreateView(ListModelMixin, CreateModelMixin, GenericAPIView):
    serializer_class = CommentSerializer
    permission_classes = [
        IsAuthenticatedOrReadOnly,
    ]

    queryset = ALL_PARENT_COMMENTS_QUERYSET

    ordering_fields = ["created_at"]
    ordering = ["created_at"]

    def get_post(self):
        try:
            story = Post.objects.published().get(uuid=self.kwargs["uuid"])
        except Post.DoesNotExist:
            raise exceptions.NotFound()
        else:
            return story

    def get(self, request, *args, **kwargs):
        post = self.get_post()
        self.queryset = self.queryset.filter(post_id=post.id)
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        self.serializer_class = PostCommentSerializer
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        post = self.get_post()

        parent_uuid = serializer.validated_data.get("parent")

        parent = Comment.objects.get(uuid=parent_uuid) if parent_uuid else None

        comment = Comment.objects.create(
            body=serializer.validated_data.get("body"),
            post_id=post.id,
            owner=serializer.validated_data.get("owner"),
            parent=parent,
        )

        return Response(CommentSerializer(comment).data, status.HTTP_201_CREATED)
