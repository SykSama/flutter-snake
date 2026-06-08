import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.object,
    required this.stackTrace,
  });

  final Object object;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Text(object.toString());
  }
}
