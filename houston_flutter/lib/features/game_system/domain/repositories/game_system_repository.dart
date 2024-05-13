import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/game_system_model.dart';

abstract interface class GameSystemRepository {
  Future<Either<Failure, PaginatedResponse<GameSystem>>> list({required int page, required int limit});
  Future<Either<Failure, GameSystem>> retrieve(int id);
  Future<Either<Failure, GameSystem>> save(GameSystem gameSystem);
  Future<Either<Failure, void>> delete(int id);
}
