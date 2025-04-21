import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/features/home/presentation/screens/home_veiw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: AppColors.white,
      isVisible: true,
      // confineToSafeArea: true,
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeVeiw(),
      Center(child: Text("Screen Two")),
      Center(child: Text("Screen Three")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _getPresistenceItem(Icons.home_filled),
      _getPresistenceItem(Icons.favorite_border_outlined),
      _getPresistenceItem(CupertinoIcons.cart),
    ];
  }

  PersistentBottomNavBarItem _getPresistenceItem(IconData icon) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      activeColorPrimary: AppColors.arrowButton,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }
}
