import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVolumeCounterWidget extends StatelessWidget {
  const CustomVolumeCounterWidget({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Volume ${coffeeModel.volume} ml",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.ligthGray),
          ),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return _getCounterWidget(context);
            },
          ),
        ),
      ],
    );
  }

  Row _getCounterWidget(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap:
              () => context.read<HomeCubit>().decrementQuantity(
                coffeeModel: coffeeModel,
              ),
          child: Icon(Icons.remove, color: AppColors.black),
        ),
        SizedBox(width: 16),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              coffeeModel.quantity.toString(),
              style: Theme.of(context).textTheme.labelMedium,
            );
          },
        ),
        SizedBox(width: 16),
        InkWell(
          onTap:
              () => context.read<HomeCubit>().incrementQuantity(
                coffeeModel: coffeeModel,
              ),
          child: Icon(Icons.add, color: AppColors.black),
        ),
      ],
    );
  }
}
