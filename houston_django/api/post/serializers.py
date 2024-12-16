from rest_framework import serializers

from api.user.serializers import UserPublicSerializer
from content.models import Post


class PostSerializer(serializers.ModelSerializer):
    owner = UserPublicSerializer(read_only=True)
    num_assets = serializers.IntegerField(read_only=True)

    class Meta:
        model = Post
        fields = [
            "id",
            "uuid",
            "title",
            "body",
            "owner",
            "num_assets",
            "assets",
            "is_unlisted",
            "is_published",
            "metadata",
            "created_at",
        ]
        read_only_fields = [
            "id",
            "uuid",
            "owner",
            "num_assets",
            "metadata",
            "created_at",
        ]


class PostCommentSerializer(serializers.Serializer):
    body = serializers.CharField()
    owner = serializers.HiddenField(default=serializers.CurrentUserDefault())
    parent = serializers.CharField(default=None)
