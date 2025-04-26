import 'package:coffee_app/core/functions/toast_alert.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_category_itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeGetCategoriesFailureState) {
            toastAlert(color: Colors.red, msg: state.error);
          }
        },
        builder: (context, state) {
          final home = context.read<HomeCubit>();
          return state is HomeGetCategoriesLoadingState
              ? Center(
                child: CircularProgressIndicator(color: AppColors.arrowButton),
              )
              : ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: home.categoryList.length,
                separatorBuilder: (context, index) => SizedBox(width: 7),
                itemBuilder:
                    (context, index) => CustomCategoryItem(
                      categoryModel: home.categoryList[index],
                      index: index,
                    ),
              );
        },
      ),
    );
  }
}
