import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';
import 'package:fnake/app/theme/theme_provider.dart';
import 'package:fnake/app/theme/themes.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';

class BoardComponent extends PositionComponent with RiverpodComponentMixin {
  BoardComponent({required this.config});

  final GameConfig config;

  final Paint _backgroundPaint = Paint();
  final Paint _gridPaint = Paint()..strokeWidth = 1;

  double cellSize = 0;

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
    _backgroundPaint.color = gt.boardColor;
    _gridPaint.color = gt.gridLineColor;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    final boardSize = size.x < size.y ? size.x : size.y;
    this.size = Vector2.all(boardSize);
    position = Vector2((size.x - boardSize) / 2, (size.y - boardSize) / 2);
    cellSize = boardSize / config.columns;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _backgroundPaint);

    for (var x = 1; x < config.columns; x++) {
      final offset = x * cellSize;
      canvas.drawLine(Offset(offset, 0), Offset(offset, size.y), _gridPaint);
    }

    for (var y = 1; y < config.rows; y++) {
      final offset = y * cellSize;
      canvas.drawLine(Offset(0, offset), Offset(size.x, offset), _gridPaint);
    }
  }
}
