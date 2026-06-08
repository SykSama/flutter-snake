import 'dart:math';

import 'package:fnake/modules/game/domain/models/cell.dart';
import 'package:fnake/modules/game/domain/models/direction.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';

/// Outcome of a single simulation tick.
class SnakeStepResult {
  const SnakeStepResult({required this.ateFood, required this.gameOver});

  final bool ateFood;
  final bool gameOver;
}

/// Pure game-logic simulation for snake — no rendering or timing.
///
/// Call [step] at a fixed interval (driven by [GameConfig.movesPerSecond])
/// and [queueDirection] whenever the player inputs a new direction.
class SnakeSimulation {
  SnakeSimulation({
    required this.config,
    Random? random,
    List<Cell>? initialBody,
  }) : _random = random ?? Random() {
    reset();
    if (initialBody != null) {
      _body = List.of(initialBody);
      _food = _randomEmptyCell();
    }
  }

  final GameConfig config;
  final Random _random;

  late List<Cell> _body;
  late Cell _food;
  Direction _direction = Direction.right;
  Direction? _queuedDirection;

  List<Cell> get body => List.unmodifiable(_body);
  Cell get head => _body.first;
  Cell get food => _food;
  Direction get direction => _direction;

  /// Resets the snake to a 3-cell horizontal line at the center of the grid.
  void reset() {
    final centerX = config.columns ~/ 2;
    final centerY = config.rows ~/ 2;
    _direction = Direction.right;
    _queuedDirection = null;
    _body = [
      Cell(centerX, centerY),
      Cell(centerX - 1, centerY),
      Cell(centerX - 2, centerY),
    ];
    _food = _randomEmptyCell();
  }

  /// Buffers a direction change for the next [step].
  ///
  /// Checked against the *queued* direction (not the current one) so two
  /// rapid opposite inputs within the same tick can't reverse the snake.
  void queueDirection(Direction next) {
    final current = _queuedDirection ?? _direction;
    if (current == next || current.isOpposite(next)) return;
    _queuedDirection = next;
  }

  /// Advances the simulation by one grid step.
  SnakeStepResult step() {
    _applyQueuedDirection();

    final nextHead = head.move(_direction);
    if (_isOutOfBounds(nextHead)) {
      return const SnakeStepResult(ateFood: false, gameOver: true);
    }

    final ateFood = nextHead == _food;

    // When not eating, exclude the tail from collision — it will vacate this
    // tick. When eating, the tail stays, so the full body is in play.
    final collisionBody = ateFood ? _body : _body.take(_body.length - 1);
    if (collisionBody.contains(nextHead)) {
      return SnakeStepResult(ateFood: ateFood, gameOver: true);
    }

    _body = [nextHead, ..._body];
    if (ateFood) {
      _food = _randomEmptyCell();
    } else {
      _body.removeLast();
    }

    return SnakeStepResult(ateFood: ateFood, gameOver: false);
  }

  void _applyQueuedDirection() {
    final queued = _queuedDirection;
    if (queued != null && !_direction.isOpposite(queued)) {
      _direction = queued;
    }
    _queuedDirection = null;
  }

  bool _isOutOfBounds(Cell cell) {
    return cell.x < 0 ||
        cell.y < 0 ||
        cell.x >= config.columns ||
        cell.y >= config.rows;
  }

  Cell _randomEmptyCell() {
    final occupied = _body.toSet();
    final emptyCells = <Cell>[];
    for (var y = 0; y < config.rows; y++) {
      for (var x = 0; x < config.columns; x++) {
        final cell = Cell(x, y);
        if (!occupied.contains(cell)) emptyCells.add(cell);
      }
    }
    // Board is completely full (win state) — food placement is a no-op.
    if (emptyCells.isEmpty) return head;
    return emptyCells[_random.nextInt(emptyCells.length)];
  }
}
