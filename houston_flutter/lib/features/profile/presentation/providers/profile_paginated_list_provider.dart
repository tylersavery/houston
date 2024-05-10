import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../state/profile_paginated_list_state.dart';
import '../../domain/providers/profile_repository_provider.dart';

part 'profile_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ProfilePaginatedList extends _$ProfilePaginatedList {
  @override
  ProfilePaginatedListState build() {
    load(page: 1);
    return ProfilePaginatedListStateInitial();
  }

  Future<void> load(
      {required int page, int limit = Constants.defaultPaginationLimit}) async {
    state = ProfilePaginatedListStateLoading();
    final result = await ref
        .read(profileRepositoryProvider)
        .list(page: page, limit: limit);

    result.fold((failure) {
      state = ProfilePaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = ProfilePaginatedListStateSuccess(data: data);
    });
  }
}
