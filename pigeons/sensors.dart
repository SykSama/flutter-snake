import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/sensors.g.dart',
    dartOptions: DartOptions(ignoreLints: true),
    swiftOut: 'ios/Runner/Sensors.g.swift',
    swiftOptions: SwiftOptions(includeErrorClass: false),
    dartPackageName: 'fnake',
  ),
)
@EventChannelApi()
abstract class SensorStreams {
  AccelerometerEvent accelerometerEventStream();
  GyroscopeEvent gyroscopeEventStream();
}

/// Discrete reading from a gyroscope. Gyroscopes measure the rate or rotation of
/// the device in 3D space.
class GyroscopeEvent {
  /// Constructs an instance with the given [x], [y], and [z] values.
  GyroscopeEvent(this.x, this.y, this.z, this.timestamp);

  /// Rate of rotation around the x axis measured in rad/s.
  ///
  /// When the device is held upright, this can also be thought of as describing
  /// "pitch". The top of the device will tilt towards or away from the
  /// user as this value changes.
  final double x;

  /// Rate of rotation around the y axis measured in rad/s.
  ///
  /// When the device is held upright, this can also be thought of as describing
  /// "yaw". The lengthwise edge of the device will rotate towards or away from
  /// the user as this value changes.
  final double y;

  /// Rate of rotation around the z axis measured in rad/s.
  ///
  /// When the device is held upright, this can also be thought of as describing
  /// "roll". When this changes the face of the device should remain facing
  /// forward, but the orientation will change from portrait to landscape and so
  /// on.
  final double z;

  /// timestamp of the event
  ///
  /// This is the timestamp of the event in microseconds, as provided by the
  /// underlying platform. For Android, this is the uptimeMillis provided by
  /// the SensorEvent. For iOS, this is the timestamp provided by the CMDeviceMotion.
  final double timestamp;
}

/// Discrete reading from an accelerometer. Accelerometers measure the velocity
/// of the device. Note that these readings include the effects of gravity. Put
/// simply, you can use accelerometer readings to tell if the device is moving in
/// a particular direction.
class AccelerometerEvent {
  /// Constructs an instance with the given [x], [y], and [z] values.
  AccelerometerEvent(this.x, this.y, this.z, this.timestamp);

  /// Acceleration force along the x axis (including gravity) measured in m/s^2.
  ///
  /// When the device is held upright facing the user, positive values mean the
  /// device is moving to the right and negative mean it is moving to the left.
  final double x;

  /// Acceleration force along the y axis (including gravity) measured in m/s^2.
  ///
  /// When the device is held upright facing the user, positive values mean the
  /// device is moving towards the sky and negative mean it is moving towards
  /// the ground.
  final double y;

  /// Acceleration force along the z axis (including gravity) measured in m/s^2.
  ///
  /// This uses a right-handed coordinate system. So when the device is held
  /// upright and facing the user, positive values mean the device is moving
  /// towards the user and negative mean it is moving away from them.
  final double z;

  /// timestamp of the event
  ///
  /// This is the timestamp of the event in microseconds, as provided by the
  /// underlying platform. For Android, this is the uptimeMillis provided by
  /// the SensorEvent. For iOS, this is the timestamp provided by the CMDeviceMotion.
  final double timestamp;
}
