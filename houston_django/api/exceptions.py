from rest_framework.exceptions import *


class BadRequest(APIException):
    status_code = status.HTTP_400_BAD_REQUEST
    default_detail = {"error": "Bad request (400)"}
    default_code = "bad_request"


class Conflict(APIException):
    status_code = status.HTTP_409_CONFLICT
    default_detail = {"error": "Conflict (409)"}
    default_code = "conflict"


class ServerError(APIException):
    status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
    default_detail = {"error": "Server error (500)"}
    default_code = "server_error"


class ServiceUnavailable(APIException):
    status_code = status.HTTP_503_SERVICE_UNAVAILABLE
    default_detail = {"error": "Service unavailable (503)"}
    default_code = "service_unavailable"
