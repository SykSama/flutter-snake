import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';
import 'package:fnake/app/theme/theme_provider.dart';
import 'package:fnake/app/theme/themes.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';
import 'package:fnake/modules/game/presentation/components/board.component.dart';
import 'package:fnake/modules/game/presentation/components/food.component.dart';
import 'package:fnake/modules/game/presentation/components/game_loop.component.dart';
import 'package:fnake/modules/game/presentation/components/snake.component.dart';

class SnakeGame extends FlameGame with RiverpodGameMixin {
  Color _backgroundColor = const Color(0xFF071013);

  @override
  Color backgroundColor() => _backgroundColor;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    addToGameWidgetBuild(() {
      _backgroundColor = ref.read(themeProviderProvider).themeData.gameTheme.gameBackgroundColor;
      ref.listen<AppTheme>(themeProviderProvider, (_, next) {
        _backgroundColor = next.themeData.gameTheme.gameBackgroundColor;
      });
    });

    final config = ref.read(gameConfigProvider);
    final board = BoardComponent(config: config);
    final simulation = SnakeSimulation(config: config);

    await add(board);
    await board.add(FoodComponent(board: board, simulation: simulation));
    await board.add(SnakeComponent(board: board, simulation: simulation));
    await board.add(GameLoopComponent(simulation: simulation));
  }
}
