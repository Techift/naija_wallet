import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naija_wallet/core/router/routes.dart';
import 'package:naija_wallet/features/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              AuthService.register();
              context.go(Routes.home);
            },child: const Text('Register'))
          ],
        ),
      )
    );
  }
}
