import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_django.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_serverpod.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_supabase.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final assetDataSourceProvider = Provider<AssetDataSource>((ref) {
  switch (Constants.serverBackend) {
    case ServerBackendOption.supabase:
      return AuthDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
    case ServerBackendOption.serverpod:
      return AuthDataSourceServerpodImpl(
        ref.read(serverpodClientProvider),
        ref.read(serverpodSessionManagerProvider),
      );
  }
});
