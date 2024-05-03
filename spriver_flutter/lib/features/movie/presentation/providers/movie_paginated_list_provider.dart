import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/features/movie/domain/usecases/movie_list_usecase.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_paginated_list_state.dart';

part 'movie_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MoviePaginatedList extends _$MoviePaginatedList {
  @override
  MoviePaginatedListState build() {
    load(page: 1, limit: 1);
    return MoviePaginatedListStateInitial();
  }

  Future<void> load({required int page, required int limit}) async {
    state = MoviePaginatedListStateLoading();
    final result = await ref.read(movieListUseCaseProvider)(MovieListParams(page: page, limit: limit));

    result.fold((failure) {
      state = MoviePaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = MoviePaginatedListStateSuccess(data: data);
    });
  }
}
