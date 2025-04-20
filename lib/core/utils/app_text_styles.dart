import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: 'Poppins',
      color: color,
      overflow: TextOverflow.ellipsis,
    );
  }

  //you can add any style like this:
  static final logoStyle = _textStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}
