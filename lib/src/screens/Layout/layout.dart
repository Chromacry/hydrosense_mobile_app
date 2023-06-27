import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Layout/BottomNavigation/bottom_navigation.dart';

class Layout extends StatelessWidget {
  static String routeName = '/Layout';
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigation();
  }
}
