import 'package:coffee_app/features/home/presentation/widgets/custom_text_container_widget.dart';
import 'package:flutter/material.dart';

class CustomSizeCupWidget extends StatelessWidget {
  const CustomSizeCupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder:
            (context, index) =>
                CustomTextContainerWidget(text: "Medium"),
      ),
    );
  }
}