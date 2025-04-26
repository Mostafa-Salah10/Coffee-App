import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CustomFavCartItem extends StatelessWidget {
  const CustomFavCartItem({super.key, required this.coffeeModel, this.onTap});
  final CoffeeModel coffeeModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.centerLeft,
      child: ListTile(
        leading: _getLeadingitem(),
        title: Text(
          coffeeModel.categoryName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          '${coffeeModel.price} \$',
          style: Theme.of(context).textTheme.labelMedium,
        ),

        trailing: InkWell(
          onTap: onTap,
          child: Icon(Icons.delete, color: AppColors.ligthGray),
        ),
      ),
    );
  }

  Container _getLeadingitem() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 70,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.asset(coffeeModel.imagePath, fit: BoxFit.fill),
    );
  }
}
