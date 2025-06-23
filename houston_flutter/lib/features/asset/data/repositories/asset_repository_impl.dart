import 'dart:typed_data';

import 'package:fpdart/src/either.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/error/failures.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_data_source.dart';
import 'package:houston_flutter/features/asset/domain/repositories/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetDataSource dataSource;

  const AssetRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, String>> upload({
    required String contentType,
    required String filename,
    required Uint8List bytes,
  }) async {
    try {
      final result = await dataSource.upload(
        contentType: contentType,
        filename: filename,
        bytes: bytes,
      );

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
