import 'package:flutter/material.dart';

class GameThemeExtension extends ThemeExtension<GameThemeExtension> {
  const GameThemeExtension({required this.snakeColor});

  final Color snakeColor;

  @override
  ThemeExtension<GameThemeExtension> copyWith({Color? snakeColor}) {
    return GameThemeExtension(snakeColor: snakeColor ?? this.snakeColor);
  }

  @override
  GameThemeExtension lerp(
    covariant ThemeExtension<GameThemeExtension>? other,
    double t,
  ) {
    if (other == null) return this;
    if (other is! GameThemeExtension) return this;

    return GameThemeExtension(
      snakeColor: Color.lerp(snakeColor, other.snakeColor, t)!,
    );
  }
}

extension GameThemeExtensionData on ThemeData {
  GameThemeExtension get gameTheme {
    return extension<GameThemeExtension>()!;
  }
}
