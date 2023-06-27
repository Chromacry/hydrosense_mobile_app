import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/view/water_usage_view.dart';

class WaterUsage extends StatelessWidget {
  static String routeName = '/WaterUsage';
  const WaterUsage({super.key});
  @override
  Widget build(context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Login')),
      //   backgroundColor: Colors.black87,
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: WaterUsageView(),
    );
  }
}
