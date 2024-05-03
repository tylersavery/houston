import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/app.dart';
import 'package:spriver_flutter/core/providers/current_user_provider.dart';
import 'package:spriver_flutter/core/widgets/navigation/dashboard.dart';
import 'package:spriver_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:spriver_flutter/features/auth/presentation/screens/register_screen.dart';
import 'package:spriver_flutter/features/auth/presentation/screens/verification_screen.dart';
import 'package:spriver_flutter/features/movie/presentation/movie_routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: LoginScreen.route(),
    routes: [
      GoRoute(
        path: LoginScreen.route(),
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.route(),
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: VerificationScreen.route(),
        builder: (context, state) => const VerificationScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Dashboard(navigationShell: navigationShell);
        },
        branches: [
          MovieRoutes.branch,
          //::HOUSTON_INSERT_ROUTE::
        ],
      )
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text('404 Page Not Found'),
        ),
      ),
    ),
    redirect: (context, state) {
      final userState = ref.read(currentUserProvider);

      final publicRoutes = [
        LoginScreen.route(),
        RegisterScreen.route(),
        VerificationScreen.route(),
      ];

      if (!publicRoutes.contains(state.matchedLocation)) {
        if (userState is CurrentUserStateInitial) {
          return LoginScreen.route();
        }
      }

      return null;
    },
  );
}
