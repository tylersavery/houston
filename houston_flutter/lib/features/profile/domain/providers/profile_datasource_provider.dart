import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/profile_datasource_serverpod.dart';
import '../../data/datasources/profile_datasource_supabase.dart';
import '../datasources/profile_data_source.dart';

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  switch (Constants.serverBackend) {
    case ServerBackendOption.supabase:
      return ProfileDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
    case ServerBackendOption.serverpod:
    default:
      return ProfileDataSourceServerpodImpl(ref.read(serverpodClientProvider));
  }
});
