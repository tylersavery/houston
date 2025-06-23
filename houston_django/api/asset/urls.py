from django.urls import path

from api.asset.views import AssetCreateView

urlpatterns = [
    path("", AssetCreateView.as_view()),
]
