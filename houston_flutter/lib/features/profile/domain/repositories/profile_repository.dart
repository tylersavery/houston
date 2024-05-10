import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/profile_model.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, PaginatedResponse<Profile>>> list(
      {required int page, required int limit});
  Future<Either<Failure, Profile>> retrieve(int id);
  Future<Either<Failure, Profile>> save(Profile profile);
  Future<Either<Failure, void>> delete(int id);
}
