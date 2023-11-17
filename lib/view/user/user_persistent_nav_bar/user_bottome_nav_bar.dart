
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../cart/cart_screen.dart';
import '../menu/menu_screen.dart';
import '../profile/profile_screen.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens(){
    return [
      const HomeScreen(),
      const ProfileScreen(),
      const CartScreen(),
      const MenuScreen(),
    ];
  }
  List<PersistentBottomNavBarItem>  _navBarsItems(){
    return  [
    PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: teal,
        inactiveColorPrimary: black
    ),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person),
          title: "You",
          activeColorPrimary: teal,
          inactiveColorPrimary: black
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart),
          title: "Cart",
          activeColorPrimary: teal,
          inactiveColorPrimary: black
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu),
          title: "Menu",
          activeColorPrimary: teal,
          inactiveColorPrimary: black
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
