import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/session_manager_provider.dart';
import 'package:houston_flutter/features/auth/data/datasources/auth_datasource_serverpod.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceServerpodImpl(
    ref.read(serverpodClientProvider),
    ref.read(serverpodSessionManagerProvider),
  );
});
