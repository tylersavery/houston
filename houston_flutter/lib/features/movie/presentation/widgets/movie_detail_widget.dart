import 'package:flutter/material.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(movie.label),
        Text(movie.year.toString()),
      ],
    );
  }
}
