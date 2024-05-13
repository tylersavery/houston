import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/game_system_model.dart';
import '../../domain/providers/game_system_repository_provider.dart';

part 'game_system_detail_provider.g.dart';

@riverpod
Future<GameSystem> gameSystemDetail(GameSystemDetailRef ref, int id) async {
  final result = await ref.read(gameSystemRepositoryProvider).retrieve(id);
  
  return result.fold((failure) => throw Exception(failure), (gameSystem) => gameSystem);
}
