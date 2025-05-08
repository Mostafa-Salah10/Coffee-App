import 'package:coffee_app/core/functions/custom_navigator.dart';
import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/core/utils/assets.dart';
import 'package:coffee_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
                SizedBox(height: 35.h),
                Center(child: Image.asset(Assets.assetsImagesCupIcon)),
                SizedBox(height: 3.h),
                Text(
                  AppStrings.coffeeTaste,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 45.h),
                Image.asset(
                  Assets.assetsImagesOnboardingImage,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 40.h),
                Text(
                  AppStrings.findYourFav,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 3.h),
                Text(
                  AppStrings.coffeeTaste,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: 3.h),
                Text(
                  AppStrings.onboardingDesc,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 165,
                  child: CustomButton(
                    text: AppStrings.getStarted,
                    onPressed: () {
                      customPushReplacement(
                        context,
                        route: AppRoutes.signInScreen,
                      );
                    },
                  ),
                ),
              ]
              .animate(interval: 150.ms)
              .moveY(duration: 600.ms, begin: 20)
              .fadeIn(duration: 600.ms),
        ),
      ),
    );
  }
}
