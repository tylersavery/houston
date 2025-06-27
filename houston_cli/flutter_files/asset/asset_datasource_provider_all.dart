import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/session_manager_provider.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_django.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_serverpod.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_supabase.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final assetDataSourceProvider = Provider<AssetDataSource>((ref) {
  switch (Constants.serverBackend) {
    case ServerBackendOption.supabase:
      return AssetDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
    case ServerBackendOption.serverpod:
      return AssetDataSourceServerpodImpl(
        ref.read(serverpodClientProvider),
        ref.read(serverpodSessionManagerProvider),
      );
    case ServerBackendOption.django:
      return AssetDataSourceDjangoImpl(
        ref.read(restClientProvider),
        ref.read(restSessionProvider.notifier),
        ref.read(storageProvider),
      );
  }
});
