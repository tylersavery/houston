import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';

import '../../domain/datasources/asset_data_source.dart';

class AssetDataSourceDjangoImpl implements AssetDataSource {
  final RestClient client;

  AssetDataSourceDjangoImpl(this.client);

  @override
  Future<String> upload({
    required String contentType,
    required String filename,
    required Uint8List bytes,
  }) async {
    final params = {'path': filename, 'content_type': contentType};

    try {
      final result = await client.post('/asset/', data: params);

      String signedUrl = result['signed_url'];

      final String url = result['url'];

      final dio = Dio();
      final options = Options(
        contentType: contentType,
        headers: {
          // Headers.contentLengthHeader: bytes.length,
        },
      );

      await dio.put(signedUrl, data: bytes, options: options);

      return url;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
