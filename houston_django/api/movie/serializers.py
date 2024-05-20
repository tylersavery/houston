from rest_framework import serializers

from content.models import Movie


class MovieSerializer(serializers.ModelSerializer):

    class Meta:
        model = Movie
        fields = [
            "id",
            "uuid",
        ]

        read_only_fields = [
            "id",
            "uuid",
        ]
