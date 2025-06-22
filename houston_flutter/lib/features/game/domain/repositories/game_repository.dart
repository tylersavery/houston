import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/game_model.dart';

abstract interface class GameRepository {
  Future<Either<Failure, PaginatedResponse<Game>>> list({
    required int page,
    required int limit,
    String? gameSystemUid,
  });
  Future<Either<Failure, Game>> retrieve(int id);
  Future<Either<Failure, Game>> save(Game game);
  Future<Either<Failure, void>> delete(int id);
}
