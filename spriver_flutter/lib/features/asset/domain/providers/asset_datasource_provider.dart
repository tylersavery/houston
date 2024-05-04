import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/client_provider.dart';
import '../../data/datasources/asset_data_source.dart';

final assetDataSourceProvider = Provider<AssetDataSource>(
  (ref) {
    return AssetDataSourceImpl(ref.read(clientProvider));
  },
);
