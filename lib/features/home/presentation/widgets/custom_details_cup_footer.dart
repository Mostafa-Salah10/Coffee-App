import 'package:coffee_app/core/functions/toast_alert.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rounded_icon_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDetailsCupFooter extends StatelessWidget {
  const CustomDetailsCupFooter({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeAddOrRemoveToCartFailureState) {
          toastAlert(color: AppColors.red, msg: state.error);
        } else if (state is HomeAddOrRemoveToCartSuccessState) {
          toastAlert(color: AppColors.green, msg: AppStrings.addedToCart);
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            CustomRoundedIconAppBar(
              icon: Icons.shopping_cart_outlined,
              color: AppColors.ligthGray,
              padding: 10,
              onTap:
                  () => context.read<HomeCubit>().addCoffeeToCart(
                    coffeeModel: coffeeModel,
                  ),
            ),
            SizedBox(width: 30),
            Expanded(child: _getBuyButton(context)),
          ],
        );
      },
    );
  }

  MaterialButton _getBuyButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: AppColors.arrowButton,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        AppStrings.buyNow,
        style: Theme.of(
          context,
        ).textTheme.labelMedium!.copyWith(color: AppColors.white),
      ),
    );
  }
}
