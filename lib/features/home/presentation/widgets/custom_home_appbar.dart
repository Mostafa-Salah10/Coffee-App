import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(Assets.assetsImagesMessi),
        ),
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.arrowButton),
            Text(
              AppStrings.locationName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Icon(Icons.notifications_outlined, color: AppColors.arrowButton),
      ],
    );
  }
}
