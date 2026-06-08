import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/widgets/error_text_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.dataBuilder,
    this.errorBuilder,
    this.loadingBuilder,
  });

  final AsyncValue<T> value;
  final Widget Function(T) dataBuilder;
  final Widget Function(Object, StackTrace)? errorBuilder;
  final Widget Function()? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      AsyncData<T>(:final value) => dataBuilder(value),
      AsyncLoading<T>() =>
        loadingBuilder?.call() ??
            const Center(child: CircularProgressIndicator()),
      AsyncError<T>(:final error, :final stackTrace) =>
        errorBuilder?.call(error, stackTrace) ??
            Center(
              child: ErrorTextWidget(object: error, stackTrace: stackTrace),
            ),
    };
  }
}
