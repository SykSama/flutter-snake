import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/modules/game/application/snake_game_provider.dart';
import 'package:fnake/modules/game/presentation/overlays/game_hud.dart';

class GameWidget extends ConsumerStatefulWidget {
  const GameWidget({super.key});

  @override
  ConsumerState<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends ConsumerState<GameWidget> {
  late final GlobalKey<RiverpodAwareGameWidgetState> _gameKey;

  @override
  void initState() {
    super.initState();
    _gameKey = GlobalKey<RiverpodAwareGameWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.watch(snakeGameProvider);
    return Stack(
      children: [
        RiverpodAwareGameWidget(key: _gameKey, game: game),
        const GameHud(),
      ],
    );
  }
}
