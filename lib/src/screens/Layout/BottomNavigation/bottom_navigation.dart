import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  int currentIndex = 0;

  void handleNavigation() {
    
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
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
      onTap: (value) => print(value),
    );
  }
}
