import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/config/env.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = Storage();
  await storageService.init();

  final container = ProviderContainer(
    overrides: [storageProvider.overrideWithValue(storageService)],
  );

  await Supabase.initialize(
    url: "https://${Env.supabaseProject}.supabase.co",
    anonKey: Env.supabaseAnonKey,
    debug: Env.debug,
  );

  runApp(UncontrolledProviderScope(container: container, child: const App()));
}
