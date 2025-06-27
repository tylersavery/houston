import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/features/asset/data/datasources/asset_datasource_servepod.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final assetDataSourceProvider = Provider<AssetDataSource>((ref) {
  return AssetDataSourceServerpodImpl(ref.read(restClientProvider));
});
