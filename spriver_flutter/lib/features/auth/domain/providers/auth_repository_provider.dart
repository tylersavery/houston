import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/features/auth/data/repositories/auth_respository_impl.dart';
import 'package:spriver_flutter/features/auth/domain/providers/auth_datasource_provider.dart';
import 'package:spriver_flutter/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    return AuthRepositoryImpl(ref.read(authDataSourceProvider));
  },
);
