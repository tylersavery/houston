import '../../features/movie/presentation/movie_routes.dart';
import 'package:houston_flutter/features/auth/presentation/screens/complete_password_reset_screen.dart';
import 'package:houston_flutter/features/auth/presentation/screens/request_password_reset_screen.dart';
import 'package:houston_flutter/features/movie/presentation/movie_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/movie/presentation/screens/movie_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../app.dart';
import '../providers/current_user_provider.dart';
import '../widgets/navigation/dashboard.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/verification_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: MovieListScreen.route(),
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
      GoRoute(
        path: RequestPasswordResetScreen.route(),
        builder: (context, state) => const RequestPasswordResetScreen(),
      ),
      GoRoute(
        path: CompletePasswordResetScreen.route(),
        builder: (context, state) => const CompletePasswordResetScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Dashboard(navigationShell: navigationShell);
        },
        branches: [
          MovieRoutes.branch,
          //::HOUSTON_INSERT_ROUTE::
        ],
      ),
    ],
    errorPageBuilder:
        (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('404 Page Not Found'))),
        ),
    redirect: (context, state) {
      final userState = ref.read(currentUserProvider);

      final publicRoutes = [
        LoginScreen.route(),
        RegisterScreen.route(),
        VerificationScreen.route(),
        RequestPasswordResetScreen.route(),
        CompletePasswordResetScreen.route(),
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
