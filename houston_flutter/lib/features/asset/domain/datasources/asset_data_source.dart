import 'dart:typed_data';

abstract interface class AssetDataSource {
  Future<String> upload({
    required String contentType,
    required String filename,
    required Uint8List bytes,
  });
}
