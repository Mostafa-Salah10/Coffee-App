import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_fav_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: _getAppBarFav(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: home.favList.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return CustomFavCartItem(
                    coffeeModel: home.favList[index],
                    onTap: () {
                      home.addOrRemoveFavorites(
                        coffeeModel: home.favList[index],
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

  AppBar _getAppBarFav(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text("Favorite", style: Theme.of(context).textTheme.bodyLarge),
      centerTitle: true,
    );
  }
}
