import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.supabaseProject,
    anonKey: Env.supabaseAnonKey,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
