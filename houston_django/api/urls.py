from django.urls import include, path

urlpatterns = [
    path("auth/", include("api.auth.urls")),
    # path("asset/", include("api.asset.urls")),
    path("post/", include("api.post.urls")),
    path("user/", include("api.user.urls")),
    path("comment/", include("api.comment.urls")),
    #::HOUSTON-INSERT-FEATURE::
]
