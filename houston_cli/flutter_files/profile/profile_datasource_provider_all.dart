import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/session_manager_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/features/profile/data/datasources/profile_datasource_django.dart';
import 'package:houston_flutter/features/profile/data/datasources/profile_datasource_serverpod.dart';
import 'package:houston_flutter/features/profile/data/datasources/profile_datasource_supabase.dart';
import 'package:houston_flutter/features/profile/domain/datasources/profile_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  switch (Constants.serverBackend) {
    case ServerBackendOption.supabase:
      return ProfileDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
    case ServerBackendOption.serverpod:
      return ProfileDataSourceServerpodImpl(
        ref.read(serverpodClientProvider),
        ref.read(serverpodSessionManagerProvider),
      );
    case ServerBackendOption.django:
      return ProfileDataSourceDjangoImpl(
        ref.read(restClientProvider),
        ref.read(restSessionProvider.notifier),
        ref.read(storageProvider),
      );
  }
});
