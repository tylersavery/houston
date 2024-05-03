import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_flutter/core/providers/current_user_provider.dart';
import 'package:spriver_flutter/core/router/app_router.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_provider.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  bool ready = false;

  @override
  void initState() {
    ref.read(authProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    ref.listen(currentUserProvider, (previous, next) {
      router.refresh();
    });

    return MaterialApp.router(
      title: 'Clean Serverpod',
      theme: ThemeData.dark(),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
