import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naija_wallet/core/theme/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    final theme = themeState.value ?? ThemeMode.light;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Switch(
            value: theme == ThemeMode.dark,
            onChanged: (_) async {
              final nextTheme = theme == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              await ref
                  .read(themeControllerProvider.notifier)
                  .toggle(nextTheme);
            },
          ),
        ],
      ),

      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
