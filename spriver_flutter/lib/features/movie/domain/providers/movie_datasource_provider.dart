import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/client_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../data/datasources/movie_datasource.dart';

final movieDataSourceProvider = Provider<MovieDataSource>(
  (ref) {
    return MovieDataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);
