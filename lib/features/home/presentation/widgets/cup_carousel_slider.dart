import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cuup_stack_widget.dart';
import 'package:flutter/material.dart';

class CupCarouselSlider extends StatelessWidget {
  const CupCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, size) {
          return CarouselSlider.builder(
            itemCount: 15,
            options: _getCarouselOptions(size.maxHeight * 0.78),
            itemBuilder: (context, index, pageViewIndex) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.sliderColor, AppColors.black],
                  ),
                ),
                child: CustomCupStackWidget(),
              );
            },
          );
        },
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
      enlargeFactor: 0.2,
    );
  }
}
