from django.conf import settings
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
import os

from api.permissions import IsAuthenticated
from project.utils.storage import get_presigned_url
from project.utils.string import get_random_string, slugify_with_slash

from .serializers import AssetCreateSerializer


class AssetCreateView(GenericAPIView):

    permission_classes = [IsAuthenticated]
    serializer_class = AssetCreateSerializer

    def post(self, request, *args, **kwargs):

        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        path = serializer.validated_data["path"]
        content_type = serializer.validated_data["content_type"]

        namespace = get_random_string(
            "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz123456789", 8
        )

        clean_path = slugify_with_slash(path)

        key = os.path.join(*["uploads", namespace, clean_path])

        signed_url: str = get_presigned_url("put_object", key, content_type)

        url = (
            f"{settings.CLOUDFLARE_PUBLIC_BASE_URL}/{key}"
            if settings.CLOUDFLARE_PUBLIC_BASE_URL
            else f"https://{settings.AWS_STORAGE_BUCKET_NAME}.s3.{settings.AWS_DEFAULT_REGION}.amazonaws.com/{key}"
        )

        return Response(
            {"signed_url": signed_url, "url": url}, status=status.HTTP_201_CREATED
        )
