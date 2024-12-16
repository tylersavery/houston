from content.models import Post

ALL_POSTS_QUERYSET = Post.objects.filter(is_deleted=False)
