import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/game/domain/models/game_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../state/game_paginated_list_state.dart';
import '../../domain/providers/game_repository_provider.dart';
import '../../domain/models/game_list_variant.dart';

part 'game_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class GamePaginatedList extends _$GamePaginatedList {
  @override
  GamePaginatedListState build(GameListVariant variant, [String? arg]) {
    load(page: 1);
    return GamePaginatedListStateInitial();
  }

  Future<void> load({required int page, int limit = Constants.defaultPaginationLimit}) async {
    state = GamePaginatedListStateLoading();

    late final Either<Failure, PaginatedResponse<Game>> result;

    switch (variant) {
      case GameListVariant.system:
        result = await ref.read(gameRepositoryProvider).list(page: page, limit: limit, gameSystemUid: arg);
      default:
        result = await ref.read(gameRepositoryProvider).list(page: page, limit: limit);
    }

    result.fold((failure) {
      state = GamePaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = GamePaginatedListStateSuccess(data: data);
    });
  }
}
