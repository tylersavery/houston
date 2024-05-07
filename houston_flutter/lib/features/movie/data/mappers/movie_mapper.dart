import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';

class MovieMapper {
  static Movie toModel(MovieDTO movieDTO) {
    return Movie(
      id: movieDTO.id,
      uid: movieDTO.uid,
      title: movieDTO.title,
      year: movieDTO.year,
      imageUrl: movieDTO.imageUrl,
      createdAt: movieDTO.createdAt,
      updatedAt: movieDTO.updatedAt,
    );
  }

  static MovieDTO toDto(Movie movie) {
    return MovieDTO(
      id: movie.id,
      uid: movie.uid,
      title: movie.title,
      year: movie.year,
      imageUrl: movie.imageUrl,
      createdAt: movie.createdAt,
      updatedAt: movie.updatedAt,
    );
  }

  static List<Movie> listToModel(List<MovieDTO> movies) {
    return movies.map((movie) => toModel(movie)).toList();
  }

  static List<MovieDTO> listToDto(List<Movie> movies) {
    return movies.map((movie) => toDto(movie)).toList();
  }
}
