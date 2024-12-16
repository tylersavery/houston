from urllib.parse import urlencode

from django.urls import reverse
from django.utils.html import format_html
from django.utils.http import urlencode


def admin_model_view_url(
    model, view, url_args=None, url_kwargs=None, query_kwargs=None
):
    url = reverse(
        f"admin:{model._meta.app_label}_{model._meta.model_name}_{view}",
        args=url_args,
        kwargs=url_kwargs,
    )

    if query_kwargs:
        url += f"?{urlencode(query_kwargs).replace('%2C', ',')}"
    return url


def admin_model_view_link(
    model,
    view,
    label,
    url_args=None,
    url_kwargs=None,
    query_kwargs=None,
    target_blank=False,
):
    url = admin_model_view_url(model, view, url_args, url_kwargs, query_kwargs)
    attrs = {}
    if target_blank:
        attrs["target"] = "blank"
    return format_html(
        f"<a href='{url}' {' '.join(f'{key}={value}' for key, value in attrs.items())}>{label}</a>"
    )
