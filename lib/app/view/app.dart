import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naija_wallet/core/router/app_router.dart';
import 'package:naija_wallet/core/theme/app_theme.dart';
import 'package:naija_wallet/core/theme/theme_provider.dart';
import 'package:naija_wallet/l10n/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: AppTheme.light.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.light.colorScheme.primary,
          foregroundColor: AppTheme.light.colorScheme.onPrimary,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      darkTheme: AppTheme.dark.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.dark.colorScheme.primary,
          foregroundColor: AppTheme.dark.colorScheme.onPrimary,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      themeMode: ref.watch(themeProvider),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
