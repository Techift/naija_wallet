import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naija_wallet/core/router/routes.dart';
import 'package:naija_wallet/features/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child:Text('Login Page'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: () {
              AuthService.login();
              context.go(Routes.home);
            }, child: const Text('Login'),),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(onPressed: (){
                context.go(Routes.register);
              }, child: const Text('Register'))
            ],
          )
        ],
      )
    );
  }
}
