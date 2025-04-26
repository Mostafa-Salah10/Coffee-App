import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<HomeCubit>().searchOfCoffees(word: value);
      },
      cursorColor: AppColors.ligthGray,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.specialBlack,
        border: OutlineInputBorder(),
        hintText: AppStrings.search,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintStyle: Theme.of(context).textTheme.labelMedium,
        focusedBorder: _getOutlineTextFieldBorder(color: AppColors.ligthGray),
        enabledBorder: _getOutlineTextFieldBorder(color: AppColors.ligthGray),
        suffixIcon: _getSuffixIcon(),
      ),
    );
  }

  Container _getSuffixIcon() {
    return Container(
      margin: const EdgeInsets.all(7),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.arrowButton,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.search, color: AppColors.white, size: 30),
    );
  }

  OutlineInputBorder _getOutlineTextFieldBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color, width: 0.6),
    );
  }
}
