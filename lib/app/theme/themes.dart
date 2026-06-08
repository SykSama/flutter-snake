import 'package:flutter/material.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';

enum AppThemeName { neon, retro, corporate }

class AppTheme {
  final AppThemeName name;
  final ThemeData themeData;

  const AppTheme({required this.name, required this.themeData});
}

final neonTheme = AppTheme(
  name: AppThemeName.neon,
  themeData: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00FFCC),
      brightness: Brightness.dark,
    ),
    extensions: [
      const GameThemeExtension(
        snakeHeadColor: Color(0xFF00FFCC),
        snakeBodyColor: Color(0xFF00CC99),
        foodColor: Color(0xFFFF006E),
        boardColor: Color(0xFF101820),
        gridLineColor: Color(0x1FFFFFFF),
        gameBackgroundColor: Color(0xFF071013),
      ),
    ],
  ),
);

final retroTheme = AppTheme(
  name: AppThemeName.retro,
  themeData: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF33FF33),
      brightness: Brightness.dark,
    ),
    extensions: const [
      GameThemeExtension(
        snakeHeadColor: Color(0xFF33FF33),
        snakeBodyColor: Color(0xFF00BB00),
        foodColor: Color(0xFFFFB800),
        boardColor: Color(0xFF0D1B0D),
        gridLineColor: Color(0xFF1A331A),
        gameBackgroundColor: Color(0xFF000000),
      ),
    ],
  ),
);

final corporateTheme = AppTheme(
  name: AppThemeName.corporate,
  themeData: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E40AF),
      brightness: Brightness.light,
    ),
    extensions: const [
      GameThemeExtension(
        snakeHeadColor: Color(0xFF1E40AF),
        snakeBodyColor: Color(0xFF3B82F6),
        foodColor: Color(0xFFEF4444),
        boardColor: Color(0xFFFFFFFF),
        gridLineColor: Color(0xFFE2E8F0),
        gameBackgroundColor: Color(0xFFF0F4F8),
      ),
    ],
  ),
);
