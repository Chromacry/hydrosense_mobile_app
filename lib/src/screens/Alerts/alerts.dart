import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Alerts/view/alerts_view.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});
  @override
  Widget build(context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Login')),
      //   backgroundColor: Colors.black87,
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: AlertsView(),
    );
  }
}
