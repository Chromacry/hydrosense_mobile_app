import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/device_button.dart';

class DevicesWidgets {
  static Widget deviceButton({
    required String buttonText,
    required Function() onTap,
    required IconData icon,
  }) =>
      DeviceButton(
        buttonText: buttonText,
        onTap: onTap,
        icon: icon,
      );
}
