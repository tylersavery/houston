import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/features/profile/data/datasources/profile_datasource_supabase.dart';
import 'package:houston_flutter/features/profile/domain/datasources/profile_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  return ProfileDataSourceSupabaseImpl(ref.read(restClientProvider));
});
