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

class SnakeComponent extends PositionComponent with RiverpodComponentMixin {
  SnakeComponent({required this.board, required this.simulation});

  final BoardComponent board;
  final SnakeSimulation simulation;

  final Paint _headPaint = Paint();
  final Paint _bodyPaint = Paint();

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
    _headPaint.color = gt.snakeHeadColor;
    _bodyPaint.color = gt.snakeBodyColor;
  }

  @override
  void render(Canvas canvas) {
    final cellSize = board.cellSize;
    final body = simulation.body;

    for (var i = body.length - 1; i >= 0; i--) {
      final cell = body[i];
      final inset = i == 0 ? cellSize * 0.1 : cellSize * 0.16;
      final rect = Rect.fromLTWH(
        cell.x * cellSize + inset,
        cell.y * cellSize + inset,
        cellSize - inset * 2,
        cellSize - inset * 2,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(cellSize * 0.18)),
        i == 0 ? _headPaint : _bodyPaint,
      );
    }
  }
}
