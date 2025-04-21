import 'package:coffee_app/core/functions/custom_navigator.dart';
import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    _navigateToPage();
    super.initState();
  }

  Future<void> _navigateToPage() async {
    Future.delayed(Duration(seconds: 4), () {
      customPushReplacement(context, route: AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Lottie.asset(Assets.assetsImagesCoffeeLottie)),
            Transform.translate(
              offset: Offset(0, -60),
              child: Text(
                AppStrings.coffeeApp,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
