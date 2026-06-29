import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';


@riverpod
class Counter extends _$Counter {
  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 0;
  }

  void increment() {
    final current = state.value ?? 0;
    state = AsyncData(current + 1);
  }

  void decrement() {
    final current = state.value ?? 0;
    state = AsyncData(current - 1);
  }

  void reset() {
    state = const AsyncData(0);
  }
}
