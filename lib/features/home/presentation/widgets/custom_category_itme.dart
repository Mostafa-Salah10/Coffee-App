import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.index,
    required this.categoryModel,
  });
  final int index;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>();
    return InkWell(
      onTap: () {
        home.changeCategoryCurrentIndex(
          categoryName: categoryModel.name,
          index: index,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color:
              home.categoryCurrentIndex == index
                  ? AppColors.arrowButton
                  : AppColors.specialBlack,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              categoryModel.image,
              width: 20,
              height: 20,
              color:
                  home.categoryCurrentIndex == index
                      ? AppColors.white
                      : AppColors.ligthGray,
            ),
            const SizedBox(width: 10),
            Text(
              categoryModel.name,
              style:
                  home.categoryCurrentIndex == index
                      ? Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: AppColors.white)
                      : Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
