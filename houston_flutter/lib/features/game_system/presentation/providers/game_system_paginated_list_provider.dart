import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../state/game_system_paginated_list_state.dart';
import '../../domain/providers/game_system_repository_provider.dart';

part 'game_system_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class GameSystemPaginatedList extends _$GameSystemPaginatedList {
  @override
  GameSystemPaginatedListState build() {
    load(page: 1);
    return GameSystemPaginatedListStateInitial();
  }

  Future<void> load(
      {required int page, int limit = Constants.defaultPaginationLimit}) async {
    state = GameSystemPaginatedListStateLoading();
    final result = await ref
        .read(gameSystemRepositoryProvider)
        .list(page: page, limit: limit);

    result.fold((failure) {
      state = GameSystemPaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = GameSystemPaginatedListStateSuccess(data: data);
    });
  }
}
