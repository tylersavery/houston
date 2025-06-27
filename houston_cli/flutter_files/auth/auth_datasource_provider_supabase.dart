import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/auth/data/datasources/auth_datasource_supabase.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
});
