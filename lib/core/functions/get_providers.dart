import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:coffee_app/features/home/data/manager/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

List<SingleChildWidget> get getProviders {
  return [
    BlocProvider(create: (context) => AuthCubit()),
    BlocProvider(
      create:
          (context) =>
              HomeCubit()
                ..getCoffeesCategory(categoryName: AppStrings.cappuccino),
    ),
  ];
}
