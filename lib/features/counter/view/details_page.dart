import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naija_wallet/features/counter/providers/counter_provider.dart';

class DisplayPage extends ConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter =ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Display Page'),),
      body: Center(
        child: Text('$counter'),
      )
    );
  }
}