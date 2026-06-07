import CoreMotion

let motionManager = CMMotionManager()
let gravity = 9.80665

class Accelerometer: AccelerometerEventStreamStreamHandler {
    
    var eventSink: PigeonEventSink<AccelerometerEvent>?

    override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AccelerometerEvent>) {
        eventSink = sink
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { [weak self] (data, error) in
                if let error {
                    sink.error(code: "accelerometer_error", message: error.localizedDescription, details: nil)
                    return
                }
                guard let data, let eventSink = self?.eventSink else { return }
                let event = AccelerometerEvent(
                    x: data.acceleration.x * gravity,
                    y: data.acceleration.y * gravity,
                    z: data.acceleration.z * gravity,
                    timestamp: data.timestamp
                )
                eventSink.success(event)
            })
        } else {
            sink.error(code: "accelerometer_unavailable", message: "Accelerometer is not available.", details: nil)
        }
    }
    
    override func onCancel(withArguments arguments: Any?) {
        super.onCancel(withArguments: arguments)
        motionManager.stopAccelerometerUpdates()
        eventSink = nil
    }
}

class Gyroscope: GyroscopeEventStreamStreamHandler {
    var eventSink: PigeonEventSink<GyroscopeEvent>?
    
    override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<GyroscopeEvent>) {
        eventSink = sink

        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { [weak self] (data, error) in
                if let error {
                    sink.error(code: "gyroscope_error", message: error.localizedDescription, details: nil)
                    return
                }
                guard let data, let eventSink = self?.eventSink else { return }
                let event = GyroscopeEvent(
                    x: data.rotationRate.x,
                    y: data.rotationRate.y,
                    z: data.rotationRate.z,
                    timestamp: data.timestamp
                )
                eventSink.success(event)
            })
        } else {
            sink.error(code: "gyroscope_unavailable", message: "Gyroscope is not available.", details: nil)
        }
    }

    override func onCancel(withArguments arguments: Any?) {
        super.onCancel(withArguments: arguments)
        motionManager.stopGyroUpdates()
        eventSink = nil
    }
}
