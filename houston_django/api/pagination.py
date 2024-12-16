from django.conf import settings
from rest_framework import pagination
from rest_framework.response import Response


class PageNumberPagination(pagination.PageNumberPagination):
    last_page_strings = ["last"]
    max_page_size = settings.API_MAX_PAGE_SIZE
    page_query_param = "page"
    page_size = settings.API_DEFAULT_PAGE_SIZE
    page_size_query_param = "limit"

    def get_paginated_response(self, data):
        return Response(
            {
                "count": self.page.paginator.count,
                "page": self.page.number,
                "num_pages": self.page.paginator.num_pages,
                "limit": self.page.paginator.per_page,
                "next": self.get_next_link(),
                "previous": self.get_previous_link(),
                "results": data,
            }
        )

    def get_paginated_response_schema(self, schema):
        return {
            "type": "object",
            "properties": {
                "count": {"type": "integer", "example": 123},
                "page": {"type": "integer", "example": 123},
                "num_pages": {"type": "integer", "example": 123},
                "limit": {"type": "integer", "example": 123},
                "next": {
                    "type": "string",
                    "nullable": True,
                    "format": "uri",
                    "example": "http://api.example.org/accounts/?{page_query_param}=4".format(
                        page_query_param=self.page_query_param
                    ),
                },
                "previous": {
                    "type": "string",
                    "nullable": True,
                    "format": "uri",
                    "example": "http://api.example.org/accounts/?{page_query_param}=2".format(
                        page_query_param=self.page_query_param
                    ),
                },
                "results": schema,
            },
        }
