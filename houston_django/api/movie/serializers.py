from rest_framework import serializers

from content.models import Movie


class MovieSerializer(serializers.ModelSerializer):

    uid = serializers.CharField(source="uuid", required=False)

    class Meta:
        model = Movie
        fields = [
            "id",
            "uid",
            "title",
            "year",
            "image_url",
            "created_at",
        ]

        read_only_fields = [
            "id",
            "uid",
            "created_at",
            "owner",
        ]
