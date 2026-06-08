import 'package:fnake/modules/sensors/data/sensors.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors.repository.g.dart';

abstract class SensorsRepository {
  Stream<AccelerometerEvent> watchAccelerometer();
  Stream<GyroscopeEvent> watchGyroscope();
}

@riverpod
SensorsRepository sensorsRepository(Ref ref) {
  return SensorsNativeRepository();
}

class SensorsNativeRepository implements SensorsRepository {
  @override
  Stream<AccelerometerEvent> watchAccelerometer() {
    return accelerometerEventStream();
  }

  @override
  Stream<GyroscopeEvent> watchGyroscope() {
    return gyroscopeEventStream();
  }
}
