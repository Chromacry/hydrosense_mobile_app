import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/view/more_menu_view.dart';

class MoreMenu extends StatelessWidget {
  static String routeName = '/MoreMenu';
  const MoreMenu({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Login')),
      //   backgroundColor: Colors.black87,
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: MoreMenuView(),
    );
  }
}
