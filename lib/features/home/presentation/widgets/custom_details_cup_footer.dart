import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rounded_icon_appbar.dart';
import 'package:flutter/material.dart';

class CustomDetailsCupFooter extends StatelessWidget {
  const CustomDetailsCupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRoundedIconAppBar(
          icon: Icons.shopping_cart_outlined,
          color: AppColors.ligthGray,
          padding: 10,
        ),
        SizedBox(width: 30),
        Expanded(
          child: _getBuyButton(context),
        ),
      ],
    );
  }

  MaterialButton _getBuyButton(BuildContext context) {
    return MaterialButton(
          onPressed: () {},
          color: AppColors.arrowButton,
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            AppStrings.buyNow,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.white),
          ),
        );
  }
}
