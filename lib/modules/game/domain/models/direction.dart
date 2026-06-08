enum Direction {
  up,
  down,
  left,
  right;

  bool isOpposite(Direction other) {
    return switch (this) {
      Direction.up => other == Direction.down,
      Direction.down => other == Direction.up,
      Direction.left => other == Direction.right,
      Direction.right => other == Direction.left,
    };
  }
}
