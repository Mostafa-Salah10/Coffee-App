import 'package:flutter/material.dart';

class CustomImageAppBar extends StatelessWidget {
  const CustomImageAppBar({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 70,
      right: 70,
      top: -90,
      child: Image.asset(image),
    );
  }
}
