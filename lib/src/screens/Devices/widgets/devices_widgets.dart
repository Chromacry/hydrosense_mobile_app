import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/add_device_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/device_button.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/edit_device_modal.dart';

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
  static Widget addDeviceModal() => AddDeviceModal();
  static Widget editDeviceModal({
    required deviceId,
    required deviceName,
    required deviceSerialNumber,
    required deviceHouseholdId,
    required deviceLocationId,
  }) =>
      EditDeviceModal(
        deviceId: deviceId,
        deviceName: deviceName,
        deviceSerialNumber: deviceSerialNumber,
        deviceHouseholdId: deviceHouseholdId,
        deviceLocationId: deviceLocationId,
      );
}
