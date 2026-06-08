import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/modules/game/domain/models/cell.dart';
import 'package:fnake/modules/game/domain/models/direction.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';

// Always picks the last available empty cell so food lands at (19,19) on a
// default 20×20 grid — reachable by the greedy right-then-down strategy.
class _LastCellRandom implements Random {
  @override
  int nextInt(int max) => max - 1;
  @override
  double nextDouble() => 0;
  @override
  bool nextBool() => false;
}

void main() {
  group('SnakeSimulation', () {
    test('moves one cell in the current direction', () {
      final simulation = SnakeSimulation(config: const GameConfig());
      final head = simulation.head;

      final result = simulation.step();

      expect(result.gameOver, isFalse);
      expect(simulation.head, Cell(head.x + 1, head.y));
    });

    test('ignores opposite direction turns', () {
      final simulation = SnakeSimulation(config: const GameConfig());
      final head = simulation.head;

      simulation.queueDirection(Direction.left);
      simulation.step();

      expect(simulation.head, Cell(head.x + 1, head.y));
    });

    test('ends the game on wall collision', () {
      final simulation = SnakeSimulation(
        config: const GameConfig(columns: 4, rows: 4),
      );

      SnakeStepResult result;
      do {
        result = simulation.step();
      } while (!result.gameOver);

      expect(result.gameOver, isTrue);
    });

    test('food is not placed on the snake body', () {
      final simulation = SnakeSimulation(config: const GameConfig());

      expect(simulation.body, isNot(contains(simulation.food)));
    });

    test('ends the game on self collision', () {
      // 5-cell snake at (10,10). Loop: down×2, left, up forms a U without
      // premature self-collision. The final right turn drives the head into
      // (10,11) which is still in the non-tail body.
      final simulation = SnakeSimulation(
        config: const GameConfig(),
        initialBody: [
          const Cell(10, 10),
          const Cell(9, 10),
          const Cell(8, 10),
          const Cell(7, 10),
          const Cell(6, 10),
        ],
      );
      final moves = [
        Direction.down,
        Direction.down,
        Direction.left,
        Direction.up,
      ];
      for (final dir in moves) {
        simulation.queueDirection(dir);
        simulation.step();
      }
      simulation.queueDirection(Direction.right);
      final result = simulation.step();

      expect(result.gameOver, isTrue);
    });

    test('ateFood is true and body grows when reaching food', () {
      // Food is deterministically placed at (19,19). The greedy right-then-down
      // navigation reaches it without hitting walls or self.
      final simulation = SnakeSimulation(
        config: const GameConfig(),
        random: _LastCellRandom(),
      );
      final initialLength = simulation.body.length;

      SnakeStepResult result;
      var steps = 0;
      do {
        final head = simulation.head;
        final food = simulation.food;
        if (food.x > head.x) {
          simulation.queueDirection(Direction.right);
        } else if (food.x < head.x) {
          simulation.queueDirection(Direction.left);
        } else if (food.y > head.y) {
          simulation.queueDirection(Direction.down);
        } else {
          simulation.queueDirection(Direction.up);
        }
        result = simulation.step();
        steps++;
      } while (!result.ateFood && !result.gameOver && steps < 400);

      expect(result.ateFood, isTrue);
      expect(simulation.body.length, initialLength + 1);
    });
  });
}
