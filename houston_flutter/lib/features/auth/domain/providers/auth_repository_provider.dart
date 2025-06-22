import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_respository_impl.dart';
import 'auth_datasource_provider.dart';
import '../repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authDataSourceProvider));
});
