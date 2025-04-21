import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color = AppColors.primary,
    this.onPressed,
  });

  final String text;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: 50,
      padding: EdgeInsets.only(right: 5, left: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_textWidget(context), SizedBox(width: 12.w), _arrowWidget()],
      ),
    );
  }

  Text _textWidget(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.labelMedium!.copyWith(color: AppColors.white),
    );
  }

  Container _arrowWidget() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.arrowButton,
        shape: BoxShape.circle,
      ),

      child: Icon(
        Icons.arrow_forward_outlined,
        color: AppColors.white,
        size: 25,
      ),
    );
  }
}
