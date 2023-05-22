import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/DesignContants.dart';
import 'package:hydrosense_mobile_app/src/screens/Home/view/home_view.dart';

class Home extends StatelessWidget {
  static String routeName = '/Home';
  const Home({
    super.key,
    required this.context,
  });

  final BuildContext context;
  @override
  Widget build(context) {
    return const HomeView();
    // return const Scaffold(
    //   // appBar: AppBar(
    //   //   title: const Center(child: Text('Login')),
    //   //   backgroundColor: Colors.black87,
    //   // ),
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: Colors.white,
    //   body: HomeView(),
    //   // bottomNavigationBar: BottomNavigation(context: context),
    // );
  }
}
