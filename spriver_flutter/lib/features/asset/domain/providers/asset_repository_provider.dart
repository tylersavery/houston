import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/features/asset/data/repositories/asset_repository_impl.dart';
import 'package:spriver_flutter/features/asset/domain/providers/asset_datasource_provider.dart';
import 'package:spriver_flutter/features/asset/domain/repositories/asset_repository.dart';

final assetRepositoryProvider = Provider<AssetRepository>(
  (ref) {
    return AssetRepositoryImpl(ref.read(assetDataSourceProvider));
  },
);
