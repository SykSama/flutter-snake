import 'package:flutter/material.dart';
import 'package:fnake/src/sensors.g.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: accelerometerEventStream(),
            builder: (context, snapshot) =>
                Text(snapshot.data?.x.toString() ?? 'Not available'),
          ),
        ),
      ),
    );
  }
}
