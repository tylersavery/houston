from content.models import Comment

ALL_COMMENTS_QUERYSET = Comment.objects.all()
ALL_PARENT_COMMENTS_QUERYSET = Comment.objects.filter(parent__isnull=True)
