import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rounded_icon_appbar.dart';
import 'package:coffee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCupDetailsBanar extends StatelessWidget {
  const CustomCupDetailsBanar({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.36,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: size.height * 0.30,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          width: double.infinity,
          decoration: _getContainerDecoraion(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _getAppBarCup(context),
              _getStackImage(coffeeModel.imagePath),
            ],
          ),
        ),
      ),
    );
  }

  Row _getAppBarCup(context) {
    return Row(
      children: [
        CustomRoundedIconAppBar(
          icon: Icons.arrow_back,
          onTap: () {
            navigatorKey.currentState?.pop(context);
          },
        ),
        Spacer(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final home = context.read<HomeCubit>();
            return CustomRoundedIconAppBar(
              icon:
                  home.favSet.contains(coffeeModel.imagePath)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
              onTap: () => home.addOrRemoveFavorites(coffeeModel: coffeeModel),
            );
          },
        ),
      ],
    );
  }

  Positioned _getStackImage(String image) {
    return Positioned(
      bottom: -270 / 2,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 210,
        width: 210,
        child: Hero(tag: image, child: Image.asset(image, fit: BoxFit.contain)),
      ),
    );
  }

  BoxDecoration _getContainerDecoraion() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.sliderColor, AppColors.black],
      ),
    );
  }
}
