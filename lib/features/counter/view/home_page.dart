import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naija_wallet/features/counter/providers/counter_provider.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter',
            style: const TextStyle(fontSize: 24),
          ),
          ElevatedButton(onPressed: (){
            ref.read(counterProvider.notifier).increment();
          },child: const Text('+')),

          ElevatedButton(onPressed: (){
            ref.read(counterProvider.notifier).decrement();
         
          }, child: const Text('-'),),
        ],
      )
    );
  }
}
