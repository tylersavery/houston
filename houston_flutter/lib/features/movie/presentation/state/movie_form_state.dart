import '../../domain/models/movie_model.dart';

class MovieFormState {
  final Movie movie;
  final bool isLoading;
  final String? error;

  MovieFormState({required this.movie, required this.isLoading, this.error});

  static Movie get initialMovie {
    return Movie(
      id: null,
      uid: "",
      title: "",
      year: 0,
      imageUrl: "",
      createdAt: DateTime.now(),
    );
  }

  factory MovieFormState.initial() {
    return MovieFormState(isLoading: false, movie: initialMovie);
  }

  MovieFormState loading() {
    return MovieFormState(movie: movie, isLoading: true, error: null);
  }

  MovieFormState success(Movie movie) {
    return MovieFormState(movie: movie, isLoading: false, error: null);
  }

  MovieFormState failure(String error) {
    return MovieFormState(movie: initialMovie, isLoading: false, error: error);
  }

  MovieFormState updateMovie(Movie movie) {
    return MovieFormState(movie: movie, isLoading: isLoading, error: error);
  }

  MovieFormState clean() {
    return MovieFormState(movie: movie, isLoading: false, error: null);
  }
}
