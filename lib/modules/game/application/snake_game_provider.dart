import 'package:fnake/modules/game/snake_game.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'snake_game_provider.g.dart';

@Riverpod(keepAlive: true)
SnakeGame snakeGame(Ref ref) {
  final game = SnakeGame();
  ref.onDispose(game.onRemove);
  return game;
}
