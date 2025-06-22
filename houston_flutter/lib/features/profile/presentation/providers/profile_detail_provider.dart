import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/profile_model.dart';
import '../../domain/providers/profile_repository_provider.dart';

part 'profile_detail_provider.g.dart';

@riverpod
Future<Profile> profileDetail(ProfileDetailRef ref, int id) async {
  final result = await ref.read(profileRepositoryProvider).retrieve(id);

  return result.fold(
    (failure) => throw Exception(failure),
    (profile) => profile,
  );
}
