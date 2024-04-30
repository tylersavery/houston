import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/core/providers/current_user_provider.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/verification_page.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_edit_page.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_list_page.dart';

part 'app_router.g.dart';

final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: LoginPage.route(),
    routes: [
      GoRoute(
        path: LoginPage.route(),
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RegisterPage.route(),
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: VerificationPage.route(),
        builder: (context, state) => const VerificationPage(),
      ),
      GoRoute(
        path: MovieListPage.route(),
        builder: (context, state) => const MovieListPage(),
      ),
      GoRoute(
        path: MovieEditPage.routeNew(),
        builder: (context, _) => const MovieEditPage(),
      ),
      GoRoute(
        path: MovieEditPage.route(),
        builder: (context, state) => MovieEditPage(
          movieId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
      GoRoute(
        path: MovieDetailPage.route(),
        builder: (context, state) => MovieDetailPage(
          movieId: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
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
        LoginPage.route(),
        RegisterPage.route(),
        VerificationPage.route(),
      ];

      if (!publicRoutes.contains(state.matchedLocation)) {
        if (userState is CurrentUserStateInitial) {
          return LoginPage.route();
        }
      }

      return null;
    },
  );
}
