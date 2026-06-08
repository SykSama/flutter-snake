import 'package:fnake/modules/sensors/application/sensors.service.dart';
import 'package:fnake/modules/sensors/data/sensors.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors.providers.g.dart';

@riverpod
Stream<GyroscopeEvent> watchGyroscope(Ref ref) {
  return ref.watch(sensorsServiceProvider).watchGyroscope();
}

@riverpod
Stream<AccelerometerEvent> watchAccelerometer(Ref ref) {
  return ref.watch(sensorsServiceProvider).watchAccelerometer();
}
