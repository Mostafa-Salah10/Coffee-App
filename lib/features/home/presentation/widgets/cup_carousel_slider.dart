import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_app/core/functions/toast_alert.dart';
import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cuup_stack_widget.dart';
import 'package:coffee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CupCarouselSlider extends StatelessWidget {
  const CupCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, size) {
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeGetCoffeesFailureState) {
                toastAlert(color: AppColors.red, msg: state.error);
              }
            },
            builder: (context, state) {
              if (state is HomeGetCoffeesLoadingStates) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.sliderColor,
                  ),
                );
              } else {
                List<CoffeeModel> coffeeList =
                    home.filterCoffeeList.isEmpty
                        ? home.coffeeList
                        : home.filterCoffeeList;
                return CarouselSlider.builder(
                  itemCount: coffeeList.length,
                  options: _getCarouselOptions(size.maxHeight * 0.78),
                  itemBuilder: (context, index, pageViewIndex) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: _getContainerDecoraion(),
                      child: InkWell(
                        onTap:
                            () => navigatorKey.currentState?.pushNamed(
                              AppRoutes.detailsCupScreen,
                              arguments: coffeeList[index],
                            ),
                        child: CustomCupStackWidget(
                          coffeeModel: coffeeList[index],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }

  BoxDecoration _getContainerDecoraion() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.sliderColor, AppColors.black],
      ),
    );
  }

  CarouselOptions _getCarouselOptions(double height) {
    return CarouselOptions(
      height: height,
      clipBehavior: Clip.none,
      enableInfiniteScroll: false,
      autoPlay: false,
      initialPage: 0,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      viewportFraction: 0.70,
      enlargeFactor: 0.30,
    );
  }
}
