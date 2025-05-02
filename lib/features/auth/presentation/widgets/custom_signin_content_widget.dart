import 'package:coffee_app/core/functions/custom_navigator.dart';
import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/core/widgets/custom_button.dart';
import 'package:coffee_app/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:coffee_app/features/auth/presentation/widgets/check_have_account_widget.dart';
import 'package:coffee_app/features/auth/presentation/widgets/custom_header_text_apbar_auth.dart';
import 'package:coffee_app/features/auth/presentation/widgets/custom_signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSigninContentWidget extends StatelessWidget {
  const CustomSigninContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();

    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
                CustomTextHeaderAppBarAuth(
                  title: AppStrings.signIn,
                  subTitle: AppStrings.weAlreadyMet,
                ),
                SizedBox(height: 45.h),
                CustomSigninForm(),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.forgotPass,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.arrowButton,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.arrowButton,
                  ),
                ),
                SizedBox(height: 100.h),
                CustomButton(
                  text: AppStrings.signUp,
                  onPressed: () {
                    if (auth.signInKey.currentState!.validate()) {
                      customPushReplacement(
                        context,
                        route: AppRoutes.bottomNavBarScreen,
                      );
                    }
                  },
                ),
                SizedBox(height: 20.h),
                CheckHaveAnAccountWidget(
                  text1: AppStrings.dontHaveAccount,
                  text2: AppStrings.signUp,
                  route: AppRoutes.signUpScreen,
                ),
              ]
              .animate(interval: 200.ms)
              .moveY(duration: 700.ms, begin: 20)
              .fadeIn(duration: 700.ms),
        ),
      ),
    );
  }
}
