import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/features/auth/presentation/screens/signin_view.dart';
import 'package:coffee_app/features/auth/presentation/screens/signup_view.dart';
import 'package:coffee_app/features/home/presentation/screens/bottom_nav_bar_view.dart';
import 'package:coffee_app/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:coffee_app/features/splash/presentation/screens/spalsh_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SpalshView());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case AppRoutes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SigninView());
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case AppRoutes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
