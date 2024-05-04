import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/movie_delete_usecase.dart';
import '../../../domain/usecases/movie_retrieve_usecase.dart';
import '../../../domain/usecases/movie_save_usecase.dart';
import '../../providers/movie_detail_provider.dart';
import '../state/movie_form_state.dart';
import '../../providers/movie_infinite_list_provider.dart';

part 'movie_form_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieForm extends _$MovieForm {
  @override
  MovieFormState build() {
    return MovieFormState.initial();
  }

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final yearController = TextEditingController();

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Title Required";
    }
    return null;
  }

  String? yearValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Year Required";
    }

    if (int.tryParse(value) == null) {
      return "Invalid Year";
    }

    return null;
  }

  Future<void> load(int movieId) async {
    final result = await ref.read(movieRetrieveUseCaseProvider)(RetrieveMovieParams(id: movieId));

    result.fold(
      (failure) {
        state = state.failure(failure.message);
      },
      (movie) {
        state = state.success(movie);
        _refreshControllers();
      },
    );
  }

  void _refreshControllers() {
    titleController.text = state.movie.title;
    yearController.text = state.movie.year.toString();
  }

  void setImageUrl(String imageUrl) {
    state = state.updateMovie(
      state.movie.copyWith(imageUrl: imageUrl),
    );
  }

  void reset() {
    state = MovieFormState.initial();
    _refreshControllers();
  }

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final movie = state.movie.copyWith(
      title: titleController.text,
      year: int.parse(yearController.text),
    );

    state = state.loading();

    final result = await ref.read(movieSaveUseCaseProvider)(
      SaveMovieParams(movie: movie),
    );

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      (movie) {
        state = state.success(movie);
        reset();
        ref.read(movieInfiniteListProvider).refresh();
        if (movie.id != null) {
          ref.invalidate(movieDetailProvider(movie.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.movie.id != null) {
      final result = await ref.read(movieDeleteUseCaseProvider)(DeleteMovieParams(id: state.movie.id!));

      return result.fold((failure) {
        state = state.failure(failure.message);
        return false;
      }, (_) {
        reset();
        ref.invalidate(movieInfiniteListProvider);
        return true;
      });
    }

    return false;
  }
}
