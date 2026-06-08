import 'dart:math';

import 'package:fnake/modules/game/domain/models/direction.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';
import 'package:fnake/modules/sensors/data/sensors.g.dart';
import 'package:fnake/modules/sensors/presentation/providers/sensors.providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_input.g.dart';

@riverpod
Direction? tiltDirection(Ref ref) {
  final event = ref.watch(watchAccelerometerProvider).value;
  if (event == null) {
    return null;
  }

  return mapAccelerometerToDirection(
    event,
    deadZone: ref.watch(gameConfigProvider).tiltDeadZone,
  );
}

Direction? mapAccelerometerToDirection(
  AccelerometerEvent event, {
  required double deadZone,
}) {
  final absX = event.x.abs();
  final absY = event.y.abs();

  if (max(absX, absY) < deadZone) {
    return null;
  }

  if (absX >= absY) {
    return event.x > 0 ? Direction.right : Direction.left;
  }

  return event.y > 0 ? Direction.up : Direction.down;
}
