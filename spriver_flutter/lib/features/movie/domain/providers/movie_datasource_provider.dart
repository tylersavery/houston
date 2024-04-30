import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/core/providers/client_provider.dart';
import 'package:spriver_flutter/core/providers/session_manager_provider.dart';
import 'package:spriver_flutter/features/movie/data/datasources/movie_data_source.dart';

final movieDataSourceProvider = Provider<MovieDataSource>(
  (ref) {
    return MovieDataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);
