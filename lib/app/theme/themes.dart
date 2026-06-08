import 'package:flutter/material.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';

enum AppThemeName { neon, retro, corporate }

class AppTheme {
  final AppThemeName name;
  final ThemeData themeData;

  const AppTheme({required this.name, required this.themeData});
}

final neonTheme = AppTheme(
  name: .neon,
  themeData: ThemeData(
    extensions: [const GameThemeExtension(snakeColor: Colors.blue)],
  ),
);

final retroTheme = AppTheme(
  name: .retro,
  themeData: ThemeData(
    extensions: [const GameThemeExtension(snakeColor: Colors.blue)],
  ),
);

final corporateTheme = AppTheme(
  name: .corporate,
  themeData: ThemeData(
    extensions: [const GameThemeExtension(snakeColor: Colors.blue)],
  ),
);
