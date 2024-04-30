import 'package:flutter/material.dart';
import 'package:spriver_client/spriver_client.dart';

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Year: ${movie.year}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        if (movie.imageUrl.isNotEmpty)
          Image.network(
            movie.imageUrl,
            width: double.infinity,
          ),
      ],
    );
  }
}
