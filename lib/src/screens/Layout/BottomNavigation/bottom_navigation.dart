import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/dashboard.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);
    
    //* ORDER OF SCREEN IS IMPORTANT
    List<Widget> buildScreens() {
      return [
      Dashboard(context: context),
      Login(context: context),
      Dashboard(context: context),
      Login(context: context),
      ];
    }

    //* ORDER OF NAV ITEMS IS IMPORTANT
    List<PersistentBottomNavBarItem> navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.insert_chart_rounded),
                title: ("Dashboard"),
                activeColorPrimary: const Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.water_drop_rounded),
                title: ("Water Usage"),
                activeColorPrimary: const Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.notifications_rounded),
                title: ("Alerts"),
                activeColorPrimary: const Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.apps_rounded),
                title: ("More Menu"),
                activeColorPrimary: const Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
                inactiveColorPrimary: Colors.grey,
            ),
        ];
    }
    return PersistentTabView(
        context,
        controller: controller,
        screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const  NavBarDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11),),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
