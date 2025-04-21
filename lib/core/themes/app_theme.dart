import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.white),
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.logoStyle,
      headlineSmall: AppTextStyles.poppins15BoldStyle,
      headlineMedium: AppTextStyles.poppins25BoldStyle,
      labelLarge: AppTextStyles.poppins30BoldStyle,
      labelMedium: AppTextStyles.poppins16BoldGrayStyle,
      bodyLarge: AppTextStyles.poppins20BoldStyle,
      labelSmall: AppTextStyles.poppins15BoldWhiteStyle,
    ),

    iconTheme: IconThemeData(color: AppColors.white, size: 25),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.ligthGray, fontSize: 16),
      errorBorder: getOutlineTextFieldBorder(color: AppColors.red),
      focusedBorder: getOutlineTextFieldBorder(color: AppColors.ligthGray),
      enabledBorder: getOutlineTextFieldBorder(color: AppColors.ligthGray),
      focusedErrorBorder: getOutlineTextFieldBorder(color: AppColors.red),
    ),
  );

  static OutlineInputBorder getOutlineTextFieldBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 0.6),
    );
  }
}
