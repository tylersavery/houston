import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/features/movie/domain/providers/movie_repository_provider.dart';
import '../../../../config/constants.dart';
import '../state/movie_paginated_list_state.dart';

part 'movie_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MoviePaginatedList extends _$MoviePaginatedList {
  @override
  MoviePaginatedListState build() {
    load(page: 1);
    return MoviePaginatedListStateInitial();
  }

  Future<void> load({required int page, int limit = Constants.defaultPaginationLimit}) async {
    state = MoviePaginatedListStateLoading();
    final result = await ref.read(movieRepositoryProvider).list(page: page, limit: limit);

    result.fold((failure) {
      state = MoviePaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = MoviePaginatedListStateSuccess(data: data);
    });
  }
}
