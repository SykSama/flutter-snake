import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/modules/game/application/game_input.dart';
import 'package:fnake/modules/game/domain/models/direction.dart';
import 'package:fnake/modules/sensors/data/sensors.g.dart';

void main() {
  group('mapAccelerometerToDirection', () {
    test('returns null inside the dead zone', () {
      final event = AccelerometerEvent(x: 1, y: 2, z: 0, timestamp: 0);

      expect(mapAccelerometerToDirection(event, deadZone: 3), isNull);
    });

    test('uses the dominant x axis', () {
      final event = AccelerometerEvent(x: -5, y: 2, z: 0, timestamp: 0);

      expect(mapAccelerometerToDirection(event, deadZone: 3), Direction.left);
    });

    test('uses the dominant y axis', () {
      final event = AccelerometerEvent(x: 2, y: 5, z: 0, timestamp: 0);

      expect(mapAccelerometerToDirection(event, deadZone: 3), Direction.up);
    });
  });
}
