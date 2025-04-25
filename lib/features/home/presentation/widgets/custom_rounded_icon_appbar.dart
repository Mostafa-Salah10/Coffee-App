import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedIconAppBar extends StatelessWidget {
  const CustomRoundedIconAppBar({
    super.key,
    required this.icon,
    this.padding = 7,
    this.color = AppColors.white,
    this.onTap,
  });

  final IconData icon;
  final void Function()? onTap;
  final double padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
