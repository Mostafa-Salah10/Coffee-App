import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomVolumeCounterWidget extends StatelessWidget {
  const CustomVolumeCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Volume 160ml",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 1,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.ligthGray),
          ),
          child: _getCounterWidget(context),
        ),
      ],
    );
  }

  Row _getCounterWidget(BuildContext context) {
    return Row(
          children: [
            Icon(Icons.remove, color: AppColors.black),
            SizedBox(width: 16),
            Text(
              "1",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(width: 16),
            Icon(Icons.add, color: AppColors.black),
          ],
        );
  }
}
