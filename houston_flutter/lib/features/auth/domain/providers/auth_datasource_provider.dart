import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/auth_data_source.dart';

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) {
    return AuthDataSourceImplSupabase(ref.read(supabaseClientProvider));
  },
);
