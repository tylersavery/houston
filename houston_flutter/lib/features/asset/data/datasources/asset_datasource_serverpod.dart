import 'dart:convert';
import 'dart:typed_data';

import 'package:houston_flutter/features/asset/domain/datasources/asset_data_source.dart';
import 'package:houston_client/houston_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/string_utils.dart';

class AssetDataSourceServerpodImpl implements AssetDataSource {
  final Client client;

  const AssetDataSourceServerpodImpl(this.client);

  @override
  Future<String> upload({
    required String contentType,
    required String filename,
    required Uint8List bytes,
  }) async {
    final name = "${generateRandomString(16)}.${filename.split('.').last}";

    final uploadDescription = await client.asset.getUploadDescription(name);

    if (uploadDescription == null) {
      throw const ServerException("Upload not successful");
    }

    final uploader = FileUploader(uploadDescription);

    await uploader.uploadByteData(ByteData.view(bytes.buffer));

    final success = await client.asset.verifyUpload(name);
    if (!success) {
      throw const ServerException("Upload failed");
    }

    final Map<String, dynamic> decodedDescription = jsonDecode(
      uploadDescription,
    );

    if (!decodedDescription.containsKey('url')) {
      throw const ServerException("No Upload URL");
    }

    return "${decodedDescription['url']}/$name";
  }
}
