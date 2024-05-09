import 'dart:convert';

import 'package:houston_flutter/features/asset/domain/datasources/asset_datasource.dart';
import 'package:image_picker/image_picker.dart';
import 'package:houston_client/houston_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/string_utils.dart';

class AssetDataSourceImplServerpod implements AssetDataSource {
  final Client client;

  const AssetDataSourceImplServerpod(this.client);

  @override
  Future<String> uploadImage(XFile image) async {
    final name = "${generateRandomString(16)}.${image.path.split('.').last}";

    final uploadDescription = await client.asset.getUploadDescription(name);

    if (uploadDescription == null) {
      throw const ServerException("Upload not successful");
    }

    final uploader = FileUploader(uploadDescription);

    final stream = image.openRead();
    final length = (await image.readAsBytes()).length;

    await uploader.upload(stream, length);

    final success = await client.asset.verifyUpload(name);

    if (!success) {
      throw const ServerException("Upload failed");
    }

    final Map<String, dynamic> decodedDescription = jsonDecode(uploadDescription);

    if (!decodedDescription.containsKey('url')) {
      throw const ServerException("No Upload URL");
    }

    return "${decodedDescription['url']}/$name";
  }
}
