import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_datasource.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetDataSource dataSource;

  AssetRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, String>> uploadImage({required XFile image}) async {
    try {
      final result = await dataSource.uploadImage(image);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
