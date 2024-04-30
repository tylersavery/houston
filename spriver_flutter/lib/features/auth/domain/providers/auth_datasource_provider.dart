import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/core/providers/client_provider.dart';
import 'package:spriver_flutter/core/providers/session_manager_provider.dart';
import 'package:spriver_flutter/features/auth/data/datasources/auth_data_source.dart';

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) {
    return AuthDataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);
