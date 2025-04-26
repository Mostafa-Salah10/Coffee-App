import 'package:coffee_app/core/enums/coffee_size_enum.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextContainerWidget extends StatelessWidget {
  const CustomTextContainerWidget({
    super.key,
    this.coffeeSize,
    this.price,
    this.color,
  });

  final CoffeeSize? coffeeSize;
  final double? price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color ?? AppColors.specialBlack,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(child: _getTextWidget(context)),
    );
  }

  Text _getTextWidget(BuildContext context) {
    return Text(
      price != null ? '\$ $price' : _getCoffeeSizeString(),
      style:
          color != null
              ? Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: AppColors.white)
              : Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: AppColors.black),
    );
  }

  String _getCoffeeSizeString() {
    final text = coffeeSize.toString().split('.').last;
    return text[0].toUpperCase() + text.substring(1);
  }
}
