import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Constants.serverBackend == ServerBackendOption.supabase) {
    await Supabase.initialize(
      url: "https://${Env.supabaseProject}.supabase.co",
      anonKey: Env.supabaseAnonKey,
      debug: Env.debug,
    );
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
