import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextContainerWidget extends StatelessWidget {
  const CustomTextContainerWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.specialBlack,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}
