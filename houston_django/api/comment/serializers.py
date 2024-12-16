from rest_framework import serializers

from content.models import Comment
from api.user.serializers import UserPublicSerializer


class ChildCommentSerializer(serializers.ModelSerializer):
    owner = UserPublicSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = [
            "uuid",
            "body",
            "owner",
            "created_at",
        ]

        read_only_fields = [
            "uuid",
            "uuid",
            "created_at",
        ]


class CommentSerializer(serializers.ModelSerializer):
    owner = UserPublicSerializer(read_only=True)
    children = ChildCommentSerializer(many=True)

    class Meta:
        model = Comment
        fields = [
            "uuid",
            "body",
            "children",
            "owner",
            "created_at",
        ]

        read_only_fields = [
            "uuid",
            "children",
            "created_at",
        ]
