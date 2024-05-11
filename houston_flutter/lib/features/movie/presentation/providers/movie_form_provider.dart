import 'package:flutter/material.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_list_variant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/providers/movie_repository_provider.dart';
import 'movie_detail_provider.dart';
import '../state/movie_form_state.dart';
import 'movie_infinite_list_provider.dart';

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

  String? titleValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Title");
  String? yearValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Year");

  Future<void> load(int movieId) async {
    final result = await ref.read(movieRepositoryProvider).retrieve(movieId);

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

  void reset() {
    state = MovieFormState.initial();
    _refreshControllers();
  }

  void setImageUrl(String value) {
    state = state.updateMovie(
      state.movie.copyWith(imageUrl: value),
    );
  }

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final movie = state.movie.copyWith(
      title: titleController.text,
      year: int.tryParse(yearController.text) ?? 0,
    );

    state = state.loading();

    final result = await ref.read(movieRepositoryProvider).save(movie);

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      (movie) {
        state = state.success(movie);
        reset();
        ref.read(movieInfiniteListProvider(MovieListVariant.all).notifier).refresh();
        if (movie.id != null) {
          ref.invalidate(movieDetailProvider(movie.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.movie.id != null) {
      final result = await ref.read(movieRepositoryProvider).delete(state.movie.id!);

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
