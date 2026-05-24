import 'package:go_router/go_router.dart';
import 'package:naija_wallet/features/auth/auth_service.dart';
import 'package:naija_wallet/features/auth/login_screen.dart';
import 'package:naija_wallet/features/auth/register_screen.dart';
import 'package:naija_wallet/features/home/home_screen.dart';
import 'package:naija_wallet/features/splash/view/splash_screen.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  
  redirect:(context, state) {
    final loggedIn = AuthService.isLoggedIn;
    final goingToLogIn = state.matchedLocation == '/login'; 

    if (!loggedIn && state.matchedLocation == '/home'){
      return '/login';
    }

    if (loggedIn && goingToLogIn == '/login'){
      return '/home';
    }

    if (loggedIn && state.matchedLocation == '/register'){
      return '/home';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
