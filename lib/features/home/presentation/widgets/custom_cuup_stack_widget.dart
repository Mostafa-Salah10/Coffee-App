import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cup_content.dart';
import 'package:flutter/material.dart';

class CustomCupStackWidget extends StatelessWidget {
  const CustomCupStackWidget({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _getStackImage(coffeeModel.imagePath),
        Positioned.fill(
          top: 100,
          child: CustomCupContent(coffeeModel: coffeeModel),
        ),
      ],
    );
  }

  Positioned _getStackImage(String image) {
    return Positioned(
      top: -150 / 2,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          height: 180,
          width: 180,
          child: Hero(
            tag: image,
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
