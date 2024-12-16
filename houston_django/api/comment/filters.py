from api import filters
from content.models import Comment

class CommentFilter(filters.FilterSet):

    class Meta:
        model = Comment
        fields = []
