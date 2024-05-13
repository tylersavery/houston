import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/game_system_detail_screen.dart';
import 'screens/game_system_edit_screen.dart';
import 'screens/game_system_list_screen.dart';

class GameSystemRoutes {
  static const String namespace = "/game-system";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "GameSystem Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: GameSystemListScreen.route(),
        builder: (context, state) => const GameSystemListScreen(),
      ),
      GoRoute(
        path: GameSystemEditScreen.routeNew(),
        builder: (context, _) => const GameSystemEditScreen(),
      ),
      GoRoute(
        path: GameSystemEditScreen.route(),
        builder: (context, state) => GameSystemEditScreen(
          gameSystemId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
      GoRoute(
        path: GameSystemDetailScreen.route(),
        builder: (context, state) => GameSystemDetailScreen(
          gameSystemId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
    ],
  );
}
