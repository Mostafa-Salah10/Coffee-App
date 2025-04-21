import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: AppColors.ligthGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 20),
          SizedBox(width: 5),
          Text(
            "3.5",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
