import 'package:coffee_app/app/coffee_app.dart';
import 'package:coffee_app/core/database/cache/hive_service.dart';
import 'package:coffee_app/core/functions/get_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([HiveService.init(), ScreenUtil.ensureScreenSize()]);
  runApp(MultiBlocProvider(providers: getProviders, child: CoffeeApp()));
}
