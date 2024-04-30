import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/core/providers/client_provider.dart';
import 'package:spriver_flutter/features/asset/data/datasources/asset_data_source.dart';

final assetDataSourceProvider = Provider<AssetDataSource>(
  (ref) {
    return AssetDataSourceImpl(ref.read(clientProvider));
  },
);
