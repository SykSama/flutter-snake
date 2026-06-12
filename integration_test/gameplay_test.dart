import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/app/app.dart';
import 'package:fnake/modules/sensors/data/sensors.g.dart';
import 'package:fnake/modules/sensors/data/sensors.repository.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Test double for the platform sensors: the test "tilts" the device by
/// adding events to [accelerometer].
class _FakeSensorsRepository implements SensorsRepository {
  final accelerometer = StreamController<AccelerometerEvent>.broadcast();

  @override
  Stream<AccelerometerEvent> watchAccelerometer() => accelerometer.stream;

  @override
  Stream<GyroscopeEvent> watchGyroscope() => const Stream.empty();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late _FakeSensorsRepository sensors;

  Future<void> pumpApp(
    WidgetTester tester, {
    Map<String, Object> initialPrefs = const {},
  }) async {
    SharedPreferences.setMockInitialValues(initialPrefs);
    sensors = _FakeSensorsRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sensorsRepositoryProvider.overrideWithValue(sensors)],
        child: const AppWidget(),
      ),
    );
    // Let the Flame game load and the tilt listener subscribe.
    await tester.pump(const Duration(milliseconds: 100));
  }

  /// Tilts the device to the right, which both starts the game and keeps the
  /// snake on its deterministic path toward the right wall.
  Future<void> tiltRight(WidgetTester tester) async {
    sensors.accelerometer.add(
      AccelerometerEvent(x: 10, y: 0, z: 0, timestamp: 0),
    );
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump();
  }

  /// Pumps real frames until [finder] matches, or fails after [timeout].
  Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    const interval = Duration(milliseconds: 100);
    var elapsed = Duration.zero;
    while (elapsed < timeout) {
      await tester.pump(interval);
      elapsed += interval;
      if (finder.evaluate().isNotEmpty) return;
    }
    fail('Timed out after $timeout waiting for $finder');
  }

  group('gameplay', () {
    testWidgets('starts in ready phase and runs on first tilt', (tester) async {
      await pumpApp(tester);

      expect(find.text('Tilt to start'), findsOneWidget);
      expect(find.text('Start'), findsOneWidget);
      expect(find.text('Score 0'), findsOneWidget);

      await tiltRight(tester);

      expect(find.text('Tilt to start'), findsNothing);
      // Running phase swaps the restart control for a pause button.
      expect(find.byIcon(Icons.pause), findsOneWidget);
    });

    testWidgets('snake dies on the wall and shows the game over panel', (
      tester,
    ) async {
      await pumpApp(tester);
      await tiltRight(tester);

      // Head starts at the board center moving right: 10 steps at 8 moves/s
      // (~1.25s) until the wall, regardless of where food spawns.
      await pumpUntilFound(tester, find.text('Game over'));

      expect(find.text('Restart'), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsNothing);
    });

    testWidgets('restart after game over resets the session', (tester) async {
      await pumpApp(tester);
      await tiltRight(tester);
      await pumpUntilFound(tester, find.text('Game over'));

      await tester.tap(find.text('Restart'));
      await tester.pump();

      expect(find.text('Game over'), findsNothing);
      expect(find.text('Score 0'), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsOneWidget);
    });

    testWidgets('pause and resume from the HUD controls', (tester) async {
      await pumpApp(tester);
      await tiltRight(tester);

      await tester.tap(find.byIcon(Icons.pause));
      await tester.pump();
      expect(find.text('Paused'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.play_arrow));
      await tester.pump();
      expect(find.text('Paused'), findsNothing);
      expect(find.byIcon(Icons.pause), findsOneWidget);
    });

    testWidgets('a worse run does not overwrite the stored best score', (
      tester,
    ) async {
      await pumpApp(tester, initialPrefs: {'high_score': 7});

      expect(find.text('Best score 7'), findsOneWidget);

      // Die on the wall with a score of 0 — the use case must not save it.
      await tiltRight(tester);
      await pumpUntilFound(tester, find.text('Game over'));

      expect(find.text('Best score 7'), findsOneWidget);
    });
  });
}
