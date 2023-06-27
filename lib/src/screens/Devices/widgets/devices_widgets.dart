import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/device_button.dart';

class DevicesWidgets {
  static Widget deviceButton({
    required String deviceNameText,
    required String deviceLocationText,
    required Function() onTap,
    required IconData icon,
  }) =>
      DeviceButton(
        deviceNameText: deviceNameText,
        deviceLocationText: deviceLocationText,
        onTap: onTap,
        icon: icon,
      );
}
