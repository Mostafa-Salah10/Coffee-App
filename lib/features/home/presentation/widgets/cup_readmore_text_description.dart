import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CupReadmoreTextDescription extends StatelessWidget {
  final String text;
  const CupReadmoreTextDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          ReadMoreText(
            text,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: AppStrings.readMore,
            trimExpandedText: AppStrings.readLess,
            moreStyle: TextStyle(color: AppColors.black),
            lessStyle: TextStyle(color: AppColors.black),
            style: TextStyle(color: AppColors.ligthGray),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
