import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:spriver_client/spriver_client.dart';

final clientProvider = Provider<Client>(
  (ref) {
    return Client(
      'http://localhost:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  },
);
