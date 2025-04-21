import 'package:coffee_app/core/utils/assets.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cup_content.dart';
import 'package:flutter/material.dart';

class CustomCupStackWidget extends StatelessWidget {
  const CustomCupStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _getStackImage(),
        Positioned.fill(top: 100, child: CustomCupContent()),
      ],
    );
  }

  Positioned _getStackImage() {
    return Positioned(
        top: -180 / 2,
        left: 0,
        right: 0,
        child: Center(
          child: SizedBox(
            height: 180,
            width: 170,
            child: Image.asset(
              Assets.assetsImagesCoffeeNew,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
  }
}
