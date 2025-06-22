import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/movie_edit_screen.dart';
import 'screens/movie_list_screen.dart';

class MovieRoutes {
  static const String namespace = "/movie";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: "Movie Shell",
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: MovieListScreen.route(),
        builder: (context, state) => const MovieListScreen(),
      ),
      GoRoute(
        path: MovieEditScreen.routeNew(),
        builder: (context, _) => const MovieEditScreen(),
      ),
      GoRoute(
        path: MovieEditScreen.route(),
        builder:
            (context, state) => MovieEditScreen(
              movieId: int.parse(state.pathParameters['id'] ?? '0'),
            ),
      ),
      GoRoute(
        path: MovieDetailScreen.route(),
        builder:
            (context, state) => MovieDetailScreen(
              movieId: int.parse(state.pathParameters['id'] ?? '0'),
            ),
      ),
    ],
  );
}
