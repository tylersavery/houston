import base64
import json
import re
from urllib.parse import parse_qs, urlparse

URL_RE = r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"


def url_encode(data):
    return base64.urlsafe_b64encode(json.dumps(data).encode()).decode()


def url_decode(data):
    return json.loads(base64.urlsafe_b64decode(data.encode()).decode())


def url_join(*parts, append_trailing_slash=True):
    url = "/".join([str(part).strip("/") for part in parts])
    if append_trailing_slash:
        url += "/"
    return url


def url_validate(url):
    return re.match(URL_RE, url)


def url_get_query_string(url):
    return parse_qs(urlparse(url).query)
