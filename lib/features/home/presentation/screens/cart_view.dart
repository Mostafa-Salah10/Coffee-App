import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/core/utils/assets.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_fav_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: _getAppBarCart(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return home.cartList.isEmpty
                  ? Center(child: Lottie.asset(Assets.assetsImagesEmpytList))
                  : ListView.separated(
                    shrinkWrap: true,
                    itemCount: home.cartList.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return CustomFavCartItem(
                        coffeeModel: home.cartList[index],
                        onTap: () {
                          home.removeCoffeeFromCart(
                            coffeeModel: home.cartList[index],
                          );
                        },
                      );
                    },
                  );
            },
          ),
        ),
      ),
    );
  }

  AppBar _getAppBarCart(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(
        AppStrings.cart,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      centerTitle: true,
    );
  }
}
