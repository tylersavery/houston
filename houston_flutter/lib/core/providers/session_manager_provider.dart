import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'serverpod_client_provider.dart';

final sessionManagerProvider = Provider<SessionManager>(
  (ref) {
    return SessionManager(caller: ref.read(serverpodClientProvider).modules.auth);
  },
);
