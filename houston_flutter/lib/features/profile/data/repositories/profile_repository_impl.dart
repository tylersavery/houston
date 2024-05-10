import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../../domain/models/profile_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRespositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  const ProfileRespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Profile>>> list({
    required int page,
    required int limit,
  }) async {
    try {
      return right(await dataSource.list(page: page, limit: limit));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> retrieve(int id) async {
    try {
      return right(await dataSource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> save(Profile profile) async {
    try {
      return right(await dataSource.save(profile));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return right(await dataSource.delete(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}