import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';

class MoviePaginatedListState {}

class MoviePaginatedListStateInitial extends MoviePaginatedListState {}

class MoviePaginatedListStateLoading extends MoviePaginatedListState {}

class MoviePaginatedListStateSuccess extends MoviePaginatedListState {
  final PaginatedResponse<Movie> data;

  MoviePaginatedListStateSuccess({required this.data});
}

class MoviePaginatedListStateFailure extends MoviePaginatedListState {
  final String error;
  MoviePaginatedListStateFailure({required this.error});
}
