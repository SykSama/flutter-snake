import 'package:fnake/app/theme/themes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeProvider extends _$ThemeProvider {
  static final themes = [neonTheme, retroTheme, corporateTheme];

  @override
  AppTheme build() => neonTheme;

  void switchTheme(AppThemeName name) {
    state = themes.firstWhere((theme) => theme.name == name);
  }
}
