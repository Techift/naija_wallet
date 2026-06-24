import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naija_wallet/core/router/routes.dart';
import 'package:naija_wallet/core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds:2), (){
      if (!mounted) return;
      context.go(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Center(
        child: Text('Naija Wallet'),
      )
    );
  }
}
