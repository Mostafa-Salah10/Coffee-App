import 'package:coffee_app/core/functions/custom_navigator.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckHaveAnAccountWidget extends StatelessWidget {
  const CheckHaveAnAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.route,
  });
  final String text1;
  final String text2;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customPushReplacement(context, route: route);
      },
      child: Text.rich(
        style: Theme.of(context).textTheme.labelMedium,
        TextSpan(
          text: text1,
          children: [
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.arrowButton,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.arrowButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
