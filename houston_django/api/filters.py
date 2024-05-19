from django_filters import *
from rest_framework.filters import OrderingFilter

from project.utils.string import string_to_bool


class CharInFilter(BaseInFilter, CharFilter):
    pass


class ChoiceInFilter(BaseInFilter, ChoiceFilter):
    pass


class NumberInFilter(BaseInFilter, NumberFilter):
    pass


class ReversibleOrderingFilter(OrderingFilter):
    def filter_queryset(self, request, queryset, view):
        try:
            reverse = "reverse" in request.query_params and string_to_bool(
                request.query_params["reverse"]
            )
        except ValueError:
            reverse = False

        if reverse:
            queryset = queryset.reverse()
        return super().filter_queryset(request, queryset, view)
