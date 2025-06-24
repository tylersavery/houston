import 'package:flutter/material.dart';
import '../../domain/models/movie_model.dart';

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(movie.label, style: Theme.of(context).textTheme.bodyLarge),
        if (movie.imageUrl.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(movie.imageUrl, height: 200),
          ),
        Text(movie.year.toString()),
      ],
    );
  }
}
