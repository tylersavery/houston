import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/asset/domain/providers/asset_repository_provider.dart';
import 'package:spriver_flutter/features/asset/domain/repositories/asset_repository.dart';

class UploadImageUseCase implements UseCase<String, UploadImageParams> {
  final AssetRepository assetRepository;

  const UploadImageUseCase(this.assetRepository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) async {
    return await assetRepository.uploadImage(image: params.image);
  }
}

class UploadImageParams {
  final XFile image;

  const UploadImageParams({
    required this.image,
  });
}

final uploadImageUseCaseProvider = Provider((ref) {
  return UploadImageUseCase(ref.read(assetRepositoryProvider));
});
