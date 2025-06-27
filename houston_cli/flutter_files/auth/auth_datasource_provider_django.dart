import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/features/auth/data/datasources/auth_datasource_django.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  ref.read(restSessionProvider.notifier);

  return AuthDataSourceDjangoImpl(
    ref.read(restClientProvider),
    ref.read(restSessionProvider.notifier),
    ref.read(storageProvider),
  );
});
