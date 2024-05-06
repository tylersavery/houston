import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_client/houston_client.dart';
import '../screens/movie_detail_screen.dart';

class MovieListTileWidget extends StatelessWidget {
  final Movie movie;

  const MovieListTileWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text(movie.year.toString()),
        onTap: () {
          context.push(MovieDetailScreen.route(movie.id));
        },
      ),
    );
  }
}
