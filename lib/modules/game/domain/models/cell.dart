import 'package:fnake/modules/game/domain/models/direction.dart';

class Cell {
  const Cell(this.x, this.y);

  final int x;
  final int y;

  Cell move(Direction direction) {
    return switch (direction) {
      Direction.up => Cell(x, y - 1),
      Direction.down => Cell(x, y + 1),
      Direction.left => Cell(x - 1, y),
      Direction.right => Cell(x + 1, y),
    };
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Cell && x == other.x && y == other.y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Cell($x, $y)';
}
