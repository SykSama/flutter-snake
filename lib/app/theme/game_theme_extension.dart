import 'package:flutter/material.dart';

class GameThemeExtension extends ThemeExtension<GameThemeExtension> {
  const GameThemeExtension({
    required this.snakeHeadColor,
    required this.snakeBodyColor,
    required this.foodColor,
    required this.boardColor,
    required this.gridLineColor,
    required this.gameBackgroundColor,
  });

  final Color snakeHeadColor;
  final Color snakeBodyColor;
  final Color foodColor;
  final Color boardColor;
  final Color gridLineColor;
  final Color gameBackgroundColor;

  @override
  GameThemeExtension copyWith({
    Color? snakeHeadColor,
    Color? snakeBodyColor,
    Color? foodColor,
    Color? boardColor,
    Color? gridLineColor,
    Color? gameBackgroundColor,
  }) {
    return GameThemeExtension(
      snakeHeadColor: snakeHeadColor ?? this.snakeHeadColor,
      snakeBodyColor: snakeBodyColor ?? this.snakeBodyColor,
      foodColor: foodColor ?? this.foodColor,
      boardColor: boardColor ?? this.boardColor,
      gridLineColor: gridLineColor ?? this.gridLineColor,
      gameBackgroundColor: gameBackgroundColor ?? this.gameBackgroundColor,
    );
  }

  @override
  GameThemeExtension lerp(
    covariant ThemeExtension<GameThemeExtension>? other,
    double t,
  ) {
    if (other == null) return this;
    if (other is! GameThemeExtension) return this;

    return GameThemeExtension(
      snakeHeadColor: Color.lerp(snakeHeadColor, other.snakeHeadColor, t)!,
      snakeBodyColor: Color.lerp(snakeBodyColor, other.snakeBodyColor, t)!,
      foodColor: Color.lerp(foodColor, other.foodColor, t)!,
      boardColor: Color.lerp(boardColor, other.boardColor, t)!,
      gridLineColor: Color.lerp(gridLineColor, other.gridLineColor, t)!,
      gameBackgroundColor: Color.lerp(gameBackgroundColor, other.gameBackgroundColor, t)!,
    );
  }
}

extension GameThemeExtensionData on ThemeData {
  GameThemeExtension get gameTheme {
    return extension<GameThemeExtension>()!;
  }
}
