from api import filters
from content.models import Movie

class MovieFilter(filters.FilterSet):

    class Meta:
        model = Movie
        fields = []
