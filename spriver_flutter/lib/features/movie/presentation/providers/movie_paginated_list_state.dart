import 'package:spriver_client/spriver_client.dart';

class MoviePaginatedListState {}

class MoviePaginatedListStateInitial extends MoviePaginatedListState {}

class MoviePaginatedListStateLoading extends MoviePaginatedListState {}

class MoviePaginatedListStateSuccess extends MoviePaginatedListState {
  final MovieList data;

  MoviePaginatedListStateSuccess({required this.data});
}

class MoviePaginatedListStateFailure extends MoviePaginatedListState {
  final String error;
  MoviePaginatedListStateFailure({required this.error});
}
