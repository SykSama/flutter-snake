import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';
import 'package:fnake/app/theme/theme_provider.dart';
import 'package:fnake/app/theme/themes.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';
import 'package:fnake/modules/game/presentation/components/board.component.dart';

class FoodComponent extends PositionComponent with RiverpodComponentMixin {
  FoodComponent({required this.board, required this.simulation});

  final BoardComponent board;
  final SnakeSimulation simulation;
  final Paint _paint = Paint();

  @override
  FutureOr<void> onLoad() {
    addToGameWidgetBuild(() {
      _applyTheme(ref.read(themeProviderProvider).themeData.gameTheme);
      ref.listen<AppTheme>(themeProviderProvider, (_, next) {
        _applyTheme(next.themeData.gameTheme);
      });
    });

    return super.onLoad();
  }

  void _applyTheme(GameThemeExtension gt) {
    _paint.color = gt.foodColor;
  }

  @override
  void render(Canvas canvas) {
    final cellSize = board.cellSize;
    final cell = simulation.food;

    final rect = Rect.fromLTWH(
      cell.x * cellSize + cellSize * 0.18,
      cell.y * cellSize + cellSize * 0.18,
      cellSize * 0.64,
      cellSize * 0.64,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(cellSize * 0.2)),
      _paint,
    );
  }
}
