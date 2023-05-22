import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/Home/home.dart';
import 'package:flutter_app/src/screens/Layout/BottomNavigation/bottom_navigation.dart';
import 'package:flutter_app/src/screens/Login/login.dart';

class Layout extends StatefulWidget {
  static String routeName = '/Layout';
  const Layout({
    Key? key,
    required BuildContext context,
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  //* Handle change in navigation
  int handleNavigation(int index) {
    setState(() {
      currentIndex = index;
    });
    return currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(context: context),
      Login(context: context),
      Home(context: context),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigation(
        context: context,
        currentIndex: currentIndex,
        onTap: handleNavigation,
      ),
    );
  }
}
