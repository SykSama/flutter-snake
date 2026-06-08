/// Immutable configuration for a snake game session.
class GameConfig {
  const GameConfig({
    this.columns = 20,
    this.rows = 20,
    this.movesPerSecond = 8,
    this.tiltDeadZone = 2,
  });

  /// Number of grid columns (horizontal cells).
  final int columns;

  /// Number of grid rows (vertical cells).
  final int rows;

  /// How many grid steps the snake advances per second.
  final double movesPerSecond;

  /// Minimum tilt angle (in degrees) required to trigger a direction change.
  /// Filters out minor device wobble so small unintentional tilts are ignored.
  final double tiltDeadZone;
}
