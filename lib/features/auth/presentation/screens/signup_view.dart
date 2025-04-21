import 'package:coffee_app/core/utils/assets.dart';
import 'package:coffee_app/features/auth/presentation/widgets/csutom_image_appbar.dart';
import 'package:coffee_app/features/auth/presentation/widgets/custom_signup_content_widget.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              CustomImageAppBar(image: Assets.assetsImagesOnboardingImage),
              CsutomSignUpContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
