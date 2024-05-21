import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/movie_model.dart';
import '../screens/movie_detail_screen.dart';

class MovieListTileWidget extends StatelessWidget {
  final Movie movie;
  final Function(Movie)? onPressed;

  const MovieListTileWidget({
    super.key,
    required this.movie,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text(movie.year.toString()),
        onTap: () {
          if (onPressed != null) {
            onPressed!(movie);
            return;
          }

          context.push(MovieDetailScreen.route(movie.id));
        },
      ),
    );
  }
}
