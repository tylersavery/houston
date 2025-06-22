import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/asset_repository_impl.dart';
import 'asset_datasource_provider.dart';
import '../repositories/asset_repository.dart';

final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  return AssetRepositoryImpl(ref.read(assetDataSourceProvider));
});
