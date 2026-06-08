import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';
import 'package:fnake/modules/game/presentation/components/board.component.dart';

class FoodComponent extends PositionComponent {
  FoodComponent({required this.board, required this.simulation});

  final BoardComponent board;
  final SnakeSimulation simulation;
  final Paint _paint = Paint()..color = const Color(0xFFFFC857);

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
