import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/presentation/widgets/cup_readmore_text_description.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_cup_details_banar.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_details_cup_footer.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_rate_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_size_cup_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_text_container_widget.dart';
import 'package:coffee_app/features/home/presentation/widgets/custom_volume_counter_widget.dart';
import 'package:flutter/material.dart';

class CupDetailsView extends StatelessWidget {
  const CupDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCupDetailsBanar(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRateWidget(color: AppColors.arrowButton),
                SizedBox(height: 10),
                _getNamePriceWidget(context),
                SizedBox(height: 15),
                Text(
                  AppStrings.coffee,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 10),
                CustomSizeCupWidget(),
                SizedBox(height: 10),
                Text(
                  AppStrings.about,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 10),
                CupReadmoreTextDescription(text: AppStrings.desc),
                SizedBox(height: 10),
                CustomVolumeCounterWidget(),
                SizedBox(height: 30),
                CustomDetailsCupFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _getNamePriceWidget(BuildContext context) {
    return Row(
      children: [
        Text("Cappuccino", style: Theme.of(context).textTheme.headlineLarge),
        Spacer(),
        CustomTextContainerWidget(text: "\$ 25.40"),
      ],
    );
  }
}
