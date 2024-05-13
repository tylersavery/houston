import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'game_datasource_provider.dart';
import '../repositories/game_repository.dart';
import '../../data/repositories/game_repository_impl.dart';

final gameRepositoryProvider = Provider<GameRepository>(
  (ref) {
    return GameRespositoryImpl(ref.read(gameDataSourceProvider));
  },
);
