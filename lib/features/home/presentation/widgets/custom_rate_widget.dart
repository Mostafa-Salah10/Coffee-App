import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({super.key, this.color = AppColors.ligthGray, required this.rate});
  final Color color;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 20),
          SizedBox(width: 5),
          Text(
            rate.toString(),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
