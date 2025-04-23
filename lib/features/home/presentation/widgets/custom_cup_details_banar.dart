import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/assets.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rounded_icon_appbar.dart';
import 'package:flutter/material.dart';

class CustomCupDetailsBanar extends StatelessWidget {
  const CustomCupDetailsBanar({super.key});

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
            children: [_getAppBarCup(), _getStackImage()],
          ),
        ),
      ),
    );
  }

  Row _getAppBarCup() {
    return Row(
      children: [
        CustomRoundedIconAppBar(icon: Icons.arrow_back),
        Spacer(),
        CustomRoundedIconAppBar(icon: Icons.favorite),
      ],
    );
  }

  Positioned _getStackImage() {
    return Positioned(
      bottom: -270 / 2,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 210,
        width: 210,
        child: Image.asset(Assets.assetsImagesCoffeeNew, fit: BoxFit.contain),
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
