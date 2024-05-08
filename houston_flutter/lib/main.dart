import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://lbxtxywnsaivmpgcuwqm.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxieHR4eXduc2Fpdm1wZ2N1d3FtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzQ4ODgsImV4cCI6MjAzMDcxMDg4OH0.CJ_bbSgIquOqiIdjrYITzbr9Rak2lGgsXmqnTXGI1wc",
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
