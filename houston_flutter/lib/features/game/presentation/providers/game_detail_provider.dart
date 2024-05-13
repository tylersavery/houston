import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/game_model.dart';
import '../../domain/providers/game_repository_provider.dart';

part 'game_detail_provider.g.dart';

@riverpod
Future<Game> gameDetail(GameDetailRef ref, int id) async {
  final result = await ref.read(gameRepositoryProvider).retrieve(id);
  
  return result.fold((failure) => throw Exception(failure), (game) => game);
}
