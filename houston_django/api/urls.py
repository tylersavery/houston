from django.urls import include, path

urlpatterns = [
    path("auth/", include("allauth.headless.urls")),
    # path("asset/", include("api.asset.urls")), #TODO
    path("post/", include("api.post.urls")),
    path("user/", include("api.user.urls")),
    path("comment/", include("api.comment.urls")),
    #::HOUSTON-INSERT-FEATURE::
]
