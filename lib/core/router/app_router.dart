import 'package:go_router/go_router.dart';
import 'package:naija_wallet/core/router/routes.dart';
import 'package:naija_wallet/features/auth/auth_service.dart';
import 'package:naija_wallet/features/auth/login_screen.dart';
import 'package:naija_wallet/features/auth/register_screen.dart';
import 'package:naija_wallet/features/home/home_screen.dart';
import 'package:naija_wallet/features/splash/view/splash_screen.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  // initialLocation: Routes.login,
  
  redirect:(context, state) {
    final loggedIn = AuthService.isLoggedIn;
    final goingToLogIn = state.matchedLocation == Routes.login; 

    if (!loggedIn && state.matchedLocation == Routes.home){
      return Routes.login;
    }

    if (loggedIn && goingToLogIn){
      return Routes.home;
    }

    if (loggedIn && state.matchedLocation == Routes.register){
      return Routes.home;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
