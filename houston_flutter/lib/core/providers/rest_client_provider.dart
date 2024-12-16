import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final restClientProvider = Provider<RestClient>(
  (ref) {
    return RestClient(ref.watch(restSessionProvider.notifier));
  },
);
