import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/game_detail_screen.dart';
import 'screens/game_edit_screen.dart';
import 'screens/game_list_screen.dart';

class GameRoutes {
  static const String namespace = "/game";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: "Game Shell",
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: GameListScreen.route(),
        builder: (context, state) => const GameListScreen(),
      ),
      GoRoute(
        path: GameEditScreen.routeNew(),
        builder: (context, _) => const GameEditScreen(),
      ),
      GoRoute(
        path: GameEditScreen.route(),
        builder:
            (context, state) => GameEditScreen(
              gameId: int.parse(state.pathParameters['id'] ?? '0'),
            ),
      ),
      GoRoute(
        path: GameDetailScreen.route(),
        builder:
            (context, state) => GameDetailScreen(
              gameId: int.parse(state.pathParameters['id'] ?? '0'),
            ),
      ),
    ],
  );
}
