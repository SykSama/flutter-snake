import 'package:flutter/material.dart';
import 'package:fnake/modules/game/game_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "fnake",
      home: Scaffold(body: SafeArea(child: GameWidget())),
    );
  }
}
