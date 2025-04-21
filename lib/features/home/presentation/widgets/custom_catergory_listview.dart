import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoryList.length,
        separatorBuilder: (context, index) => SizedBox(width: 7),
        itemBuilder: (context, index) => _getCatergoryItem(index, context),
      ),
    );
  }

  Container _getCatergoryItem(int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        color: AppColors.specialBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(categoryList[index].image, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(
            categoryList[index].name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
