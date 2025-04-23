import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedIconAppBar extends StatelessWidget {
  const CustomRoundedIconAppBar({
    super.key,
    required this.icon,
    this.padding = 7,
    this.color = AppColors.white,
  });

  final IconData icon;

  final double padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color),
    );
  }
}
