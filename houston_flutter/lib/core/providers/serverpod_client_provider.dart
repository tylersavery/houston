import 'package:houston_flutter/config/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:houston_client/houston_client.dart';

final serverpodClientProvider = Provider<Client>((ref) {
  return Client(
    Env.apiBaseUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
});
