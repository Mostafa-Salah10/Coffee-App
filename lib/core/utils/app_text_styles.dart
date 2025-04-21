import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: 'Poppins',
      color: color,
      overflow: TextOverflow.ellipsis,
      letterSpacing: letterSpacing,
    );
  }

  //you can add any style like this:
  static final logoStyle = _textStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColors.primary,
  );
  static final poppins15BoldStyle = _textStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    letterSpacing: 4,
  );
  static final poppins30BoldStyle = _textStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColors.darkBlack,
  );
  static final poppins25BoldStyle = _textStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlack,
  );
  static final poppins20BoldStyle = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlack,
  );
  static final poppins16BoldGrayStyle = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.ligthGray,
  );
  static final poppins15BoldWhiteStyle = _textStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
