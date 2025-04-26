import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cup_data_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rate_widget.dart';
import 'package:flutter/material.dart';

class CustomCupContent extends StatelessWidget {
  const CustomCupContent({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffeeModel.categoryName,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
        ),
        CustomRateWidget(rate: coffeeModel.rate),
        CustomCupDataWidget(
          volume: coffeeModel.volume,
          price: coffeeModel.price,
        ),
      ],
    );
  }
}
