import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/movie/domain/usecases/movie_list_usecase.dart';

part 'movie_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieList extends _$MovieList {
  @override
  Future<List<Movie>> build() {
    return _load();
  }

  Future<List<Movie>> _load() async {
    final result = await ref.read(movieListUseCaseProvider)(NoParams());
    return result.fold((failure) => throw Exception(failure), (movies) => movies);
  }
}
