import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextHeaderAppBarAuth extends StatelessWidget {
  const CustomTextHeaderAppBarAuth({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        SizedBox(height: 3.h),
        Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
