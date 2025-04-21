import 'package:coffee_app/app/coffee_app.dart';
import 'package:coffee_app/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit())],
      child: CoffeeApp(),
    ),
  );
}
