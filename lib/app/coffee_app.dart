import 'package:coffee_app/core/routes/app_router.dart';
import 'package:coffee_app/core/routes/app_routes.dart';
import 'package:coffee_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRoutes.detailsCupScreen,
          ),
    );
  }
}
