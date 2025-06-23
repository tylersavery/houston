import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/error/failures.dart';

abstract interface class AssetRepository {
  Future<Either<Failure, String>> upload({
    required String contentType,
    required String filename,
    required Uint8List bytes,
  });
}
