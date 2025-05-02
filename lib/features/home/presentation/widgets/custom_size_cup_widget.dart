import 'package:coffee_app/core/enums/coffee_size_enum.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_text_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSizeCupWidget extends StatelessWidget {
  const CustomSizeCupWidget({super.key, required this.cofeeSize});

  final List<CoffeeSize> cofeeSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: cofeeSize.length,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder:
            (context, index) => BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final home = context.read<HomeCubit>();
                return InkWell(
                  onTap: () => home.changeCoffeeSizeCurrentIndex(index: index),
                  child: CustomTextContainerWidget(
                        coffeeSize: cofeeSize[index],
                        color:
                            home.coffeeSizeCurrentIndex == index
                                ? AppColors.arrowButton
                                : null,
                      )
                      .animate()
                      .moveX(duration: 700.ms, begin: 20)
                      .fadeIn(duration: 700.ms)
                      .then(delay: (index * 100).ms),
                );
              },
            ),
      ),
    );
  }
}
