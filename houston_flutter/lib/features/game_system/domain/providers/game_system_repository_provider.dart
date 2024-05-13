import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'game_system_datasource_provider.dart';
import '../repositories/game_system_repository.dart';
import '../../data/repositories/game_system_repository_impl.dart';

final gameSystemRepositoryProvider = Provider<GameSystemRepository>(
  (ref) {
    return GameSystemRespositoryImpl(ref.read(gameSystemDataSourceProvider));
  },
);
