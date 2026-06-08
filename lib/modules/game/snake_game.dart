import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';
import 'package:fnake/modules/game/presentation/components/board.component.dart';
import 'package:fnake/modules/game/presentation/components/food.component.dart';
import 'package:fnake/modules/game/presentation/components/game_loop.component.dart';
import 'package:fnake/modules/game/presentation/components/snake.component.dart';

class SnakeGame extends FlameGame with RiverpodGameMixin {
  @override
  Color backgroundColor() => const Color(0xFF071013);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final config = ref.read(gameConfigProvider);
    final board = BoardComponent(config: config);
    final simulation = SnakeSimulation(config: config);

    await add(board);
    await board.add(FoodComponent(board: board, simulation: simulation));
    await board.add(SnakeComponent(board: board, simulation: simulation));
    await board.add(GameLoopComponent(simulation: simulation));
  }
}
