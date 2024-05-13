import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/models/game_model.dart';

class GamePaginatedListState {}

class GamePaginatedListStateInitial extends GamePaginatedListState {}

class GamePaginatedListStateLoading extends GamePaginatedListState {}

class GamePaginatedListStateSuccess extends GamePaginatedListState {
  final PaginatedResponse<Game> data;

  GamePaginatedListStateSuccess({required this.data});
}

class GamePaginatedListStateFailure extends GamePaginatedListState {
  final String error;
  GamePaginatedListStateFailure({required this.error});
}
