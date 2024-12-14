import 'package:flutter/material.dart';
import 'package:salla/presentation/screens/home_screen.dart';
import 'package:salla/presentation/screens/login_screen.dart';
import 'package:salla/presentation/screens/onboarding_screen.dart';
import 'package:salla/presentation/screens/register_screen.dart';

class AppRouter {

  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String onboardingRoute = '/onboarding';
  static const String registerRoute = '/register';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
