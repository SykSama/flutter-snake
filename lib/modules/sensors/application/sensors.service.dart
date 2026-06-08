import 'package:fnake/modules/sensors/data/sensors.g.dart';
import 'package:fnake/modules/sensors/data/sensors.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors.service.g.dart';

@riverpod
SensorsService sensorsService(Ref ref) {
  return SensorsService(
    sensorsRepository: ref.watch(sensorsRepositoryProvider),
  );
}

class SensorsService {
  final SensorsRepository _sensorsRepository;

  const SensorsService({required this._sensorsRepository});

  Stream<AccelerometerEvent> watchAccelerometer() {
    return _sensorsRepository.watchAccelerometer();
  }

  Stream<GyroscopeEvent> watchGyroscope() {
    return _sensorsRepository.watchGyroscope();
  }
}
