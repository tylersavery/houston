import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/game_datasource.dart';
import '../../domain/models/game_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/game_repository.dart';

class GameRespositoryImpl implements GameRepository {
  final GameDataSource dataSource;

  const GameRespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Game>>> list({
    required int page,
    required int limit,
    String? gameSystemUid,
  }) async {
    try {
      return right(await dataSource.list(page: page, limit: limit, gameSystemUid: gameSystemUid));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Game>> retrieve(int id) async {
    try {
      return right(await dataSource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Game>> save(Game game) async {
    try {
      return right(await dataSource.save(game));
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
