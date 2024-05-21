import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../../domain/models/movie_model.dart';
import '../state/movie_paginated_list_state.dart';
import '../../domain/providers/movie_repository_provider.dart';
import '../../domain/models/movie_list_variant.dart';

part 'movie_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MoviePaginatedList extends _$MoviePaginatedList {
  @override
  MoviePaginatedListState build(MovieListVariant variant, [String? arg]) {
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
