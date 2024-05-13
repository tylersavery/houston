import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/game_system_datasource.dart';
import '../../domain/models/game_system_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/game_system_repository.dart';

class GameSystemRespositoryImpl implements GameSystemRepository {
  final GameSystemDataSource dataSource;

  const GameSystemRespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<GameSystem>>> list({
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
  Future<Either<Failure, GameSystem>> retrieve(int id) async {
    try {
      return right(await dataSource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, GameSystem>> save(GameSystem gameSystem) async {
    try {
      return right(await dataSource.save(gameSystem));
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