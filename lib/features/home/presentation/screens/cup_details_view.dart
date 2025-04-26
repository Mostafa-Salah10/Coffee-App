import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:coffee_app/features/home/presentation/widgets/cup_readmore_text_description.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cup_details_banar.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_details_cup_footer.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rate_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_size_cup_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_text_container_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_volume_counter_widget.dart';
import 'package:flutter/material.dart';

class CupDetailsView extends StatelessWidget {
  const CupDetailsView({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCupDetailsBanar(coffeeModel: coffeeModel),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRateWidget(
                  color: AppColors.arrowButton,
                  rate: coffeeModel.rate,
                ),
                SizedBox(height: 10),
                _getNamePriceWidget(
                  context,
                  coffeeModel.categoryName,
                  coffeeModel.price,
                ),
                SizedBox(height: 15),
                Text(
                  AppStrings.coffee,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 10),
                CustomSizeCupWidget(cofeeSize: coffeeModel.coffeeSize),
                SizedBox(height: 10),
                Text(
                  AppStrings.about,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 10),
                CupReadmoreTextDescription(text: coffeeModel.description),
                SizedBox(height: 10),
                CustomVolumeCounterWidget(coffeeModel: coffeeModel),
                SizedBox(height: 30),
                CustomDetailsCupFooter(coffeeModel: coffeeModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _getNamePriceWidget(
    BuildContext context,
    String categoryName,
    double price,
  ) {
    return Row(
      children: [
        Text(categoryName, style: Theme.of(context).textTheme.headlineLarge),
        Spacer(),
        CustomTextContainerWidget(price: price),
      ],
    );
  }
}
