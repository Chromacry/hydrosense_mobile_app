import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Home/home.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavigation(
      {super.key,
      required BuildContext context,
      required this.currentIndex,
      required this.onTap});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: true,
      currentIndex: widget.currentIndex,
      onTap: (index) => widget.onTap(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Menu",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
