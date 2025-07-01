import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/styleguide/styleguide_screen.dart';

class StyleguideRoutes {
  static const String namespace = "/profile";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: "Profile Shell",
  );
  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: StyleguideScreen.route(),
        builder: (context, state) => const StyleguideScreen(),
      ),
    ],
  );
}
