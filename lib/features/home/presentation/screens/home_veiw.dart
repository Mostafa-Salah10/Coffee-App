import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/presentation/widgets/cup_carousel_slider.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_catergory_listview.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CustomHomeAppBar(),
            SizedBox(height: 25.h),
            CustomSearchWidget(),
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.categories,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 15.h),
            CustomCategoryListView(),
            Expanded(
              child: CupCarouselSlider(),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
