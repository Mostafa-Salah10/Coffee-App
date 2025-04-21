import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,

    textTheme: TextTheme(headlineLarge: AppTextStyles.logoStyle),
  );
}
