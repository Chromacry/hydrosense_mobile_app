import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/add_device_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/delete_device_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/device_button.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/edit_device_modal.dart';

class DevicesWidgets {
  static Widget deviceButton({
    required String deviceNameText,
    required String deviceLocationText,
    required Function() onTap,
    IconData? icon,
    Color? backgroundColorIcon,
  }) =>
      DeviceButton(
        deviceNameText: deviceNameText,
        deviceLocationText: deviceLocationText,
        onTap: onTap,
        icon: icon,
        backgroundColorIcon: backgroundColorIcon,
      );
  static Widget addDeviceModal() => AddDeviceModal();
  static Widget editDeviceModal({
    required String deviceId,
    required String deviceName,
    required String deviceSerialNumber,
    required String deviceHouseholdId,
    required String deviceLocationId,
    required List<List<String>> dropdownLocationOptions,
  }) =>
      EditDeviceModal(
        deviceId: deviceId,
        deviceName: deviceName,
        deviceSerialNumber: deviceSerialNumber,
        deviceHouseholdId: deviceHouseholdId,
        deviceLocationId: deviceLocationId,
        dropdownLocationOptions: dropdownLocationOptions,
      );
  static Widget deleteDeviceModal({
    required deviceId,
  }) =>
      DeleteDeviceModal(
        deviceId: deviceId,
      );
}
