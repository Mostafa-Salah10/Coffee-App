import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.isSecure = false,
    this.onTapSuffixIcon,
    this.keyboardType,
  });

  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool isSecure;
  final void Function()? onTapSuffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        cursorColor: AppColors.ligthGray,
        obscureText: isSecure,
        validator: _validateInput,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon:
              suffixIcon == null
                  ? null
                  : GestureDetector(onTap: onTapSuffixIcon, child: suffixIcon),
        ),
      ),
    );
  }

  String? _validateInput(value) {
    if (value!.isEmpty) {
      return AppStrings.fieldRequired;
    } else if (value.length < 10) {
      return AppStrings.fieldShort;
    } else {
      return null;
    }
  }
}
