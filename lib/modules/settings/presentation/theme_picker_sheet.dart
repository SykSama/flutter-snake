import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/theme/game_theme_extension.dart';
import 'package:fnake/app/theme/theme_provider.dart';
import 'package:fnake/app/theme/themes.dart';

class ThemePickerSheet extends ConsumerWidget {
  const ThemePickerSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const ThemePickerSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(themeProviderProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Theme', style: theme.textTheme.titleLarge),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeProvider.themes.map((appTheme) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _ThemeSplitCircle(
                  appTheme: appTheme,
                  isSelected: current.name == appTheme.name,
                  onTap: () => ref
                      .read(themeProviderProvider.notifier)
                      .switchTheme(appTheme.name),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ThemeSplitCircle extends StatelessWidget {
  const _ThemeSplitCircle({
    required this.appTheme,
    required this.isSelected,
    required this.onTap,
  });

  final AppTheme appTheme;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gt = appTheme.themeData.gameTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            width: isSelected ? 3 : 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.35),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: _SplitCircleInner(gt: gt),
        ),
      ),
    );
  }
}

class _SplitCircleInner extends StatelessWidget {
  const _SplitCircleInner({required this.gt});

  final GameThemeExtension gt;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: gt.snakeHeadColor,
              child: const SizedBox.expand(),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: gt.foodColor,
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}
