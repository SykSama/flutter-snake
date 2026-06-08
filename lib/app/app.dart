import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/theme/theme_provider.dart';
import 'package:fnake/modules/game/game_widget.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "fnake",
      theme: ref.watch(themeProviderProvider).themeData,
      home: const Scaffold(body: SafeArea(child: GameWidget())),
    );
  }
}
