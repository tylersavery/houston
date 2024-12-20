import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_serverpod.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_supabase.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final assetDataSourceProvider = Provider<AssetDataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return AssetDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
      default:
        return AssetDataSourceServerpodImpl(ref.read(serverpodClientProvider));
    }
  },
);
