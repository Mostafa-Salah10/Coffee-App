import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.logoStyle,
      headlineSmall: AppTextStyles.poppins15BoldStyle,
      headlineMedium: AppTextStyles.poppins25BoldStyle,
      labelLarge: AppTextStyles.poppins30BoldStyle,
      labelMedium: AppTextStyles.poppins16BoldGrayStyle,
    ),
    
    iconTheme: IconThemeData(color: AppColors.white, size: 25),
  );
}
