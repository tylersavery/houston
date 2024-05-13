import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/models/game_system_model.dart';

class GameSystemPaginatedListState {}

class GameSystemPaginatedListStateInitial extends GameSystemPaginatedListState {}

class GameSystemPaginatedListStateLoading extends GameSystemPaginatedListState {}

class GameSystemPaginatedListStateSuccess extends GameSystemPaginatedListState {
  final PaginatedResponse<GameSystem> data;

  GameSystemPaginatedListStateSuccess({required this.data});
}

class GameSystemPaginatedListStateFailure extends GameSystemPaginatedListState {
  final String error;
  GameSystemPaginatedListStateFailure({required this.error});
}
