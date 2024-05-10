import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'profile_datasource_provider.dart';
import '../repositories/profile_repository.dart';
import '../../data/repositories/profile_repository_impl.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) {
    return ProfileRespositoryImpl(ref.read(profileDataSourceProvider));
  },
);
