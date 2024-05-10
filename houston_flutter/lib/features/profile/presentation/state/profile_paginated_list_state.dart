import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/models/profile_model.dart';

class ProfilePaginatedListState {}

class ProfilePaginatedListStateInitial extends ProfilePaginatedListState {}

class ProfilePaginatedListStateLoading extends ProfilePaginatedListState {}

class ProfilePaginatedListStateSuccess extends ProfilePaginatedListState {
  final PaginatedResponse<Profile> data;

  ProfilePaginatedListStateSuccess({required this.data});
}

class ProfilePaginatedListStateFailure extends ProfilePaginatedListState {
  final String error;
  ProfilePaginatedListStateFailure({required this.error});
}
