from django.conf import settings
from rest_framework.permissions import BasePermission


class OrReadOnlyMixin:
    def has_permission(self, request, view):
        if self.is_safe(request):
            return True
        return super().has_permission(request, view)


class APIPermission(BasePermission):
    allow_read_only = False

    @staticmethod
    def is_safe(request):
        return request.method in ["GET", "HEAD", "OPTIONS"]


class AllowAny(APIPermission):
    def has_permission(self, request, view):
        return True


class IsAdmin(APIPermission):
    def has_permission(self, request, view):
        return request.user and getattr(request.user, "is_admin", False)


class IsAuthenticated(APIPermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated


class IsAuthenticatedOrReadOnly(OrReadOnlyMixin, IsAuthenticated):
    def has_permission(self, request, view):
        if self.is_safe(request):
            return True
        return super().has_permission(request, view)


class IsOwner(APIPermission):
    owner_field = "owner"

    def get_object_owner(self, obj):
        return getattr(obj, self.owner_field, None)

    def has_object_permission(self, request, view, obj):
        owner = self.get_object_owner(obj)
        return owner and request.user and owner == request.user


class IsOwnerOrReadOnly(OrReadOnlyMixin, IsOwner):
    def has_object_permission(self, request, view, obj):
        if self.is_safe(request):
            return True
        return super().has_object_permission(request, view, obj)


class IsAuthenticatedOrSecretToken(APIPermission):
    def has_permission(self, request, view):
        if request.user and request.user.is_authenticated:
            return True

        return False


class IsCommentPostOwner(BasePermission):
    def get_owner_object(self, obj):
        return getattr(obj, "owner", None)

    def has_object_permission(self, request, view, obj):
        owner = self.get_owner_object(obj.post)
        parent_owner = self.get_owner_object(obj.parent) if obj.parent else None
        return bool(
            (owner and owner == request.user)
            or (parent_owner and parent_owner == request.user)
        )
