import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/profile_detail_screen.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/profile_list_screen.dart';

class ProfileRoutes {
  static const String namespace = "/profile";
  static final shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Profile Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: ProfileListScreen.route(),
        builder: (context, state) => const ProfileListScreen(),
      ),
      GoRoute(
        path: ProfileEditScreen.routeNew(),
        builder: (context, _) => const ProfileEditScreen(),
      ),
      GoRoute(
        path: ProfileEditScreen.route(),
        builder: (context, state) => ProfileEditScreen(
          profileId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
      GoRoute(
        path: ProfileDetailScreen.route(),
        builder: (context, state) => ProfileDetailScreen(
          profileId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
    ],
  );
}
