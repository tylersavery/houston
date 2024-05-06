import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/client_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../data/datasources/auth_data_source.dart';

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) {
    return AuthDataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);
