import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_view.dart';

class Devices extends StatelessWidget {
  static String routeName = '/Devices';
  const Devices({
    super.key,
  });
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Devices')),
        backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: DevicesView(),
    );
  }
}
