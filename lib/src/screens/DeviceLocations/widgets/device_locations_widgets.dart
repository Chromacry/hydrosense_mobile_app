import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/add_device_location_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/delete_device_location_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/device_location_item.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/edit_device_location_modal.dart';

class DeviceLocationsWidgets {
  static Widget deviceLocationItem({
    required locationName,
    required locationHouseholdId,
    required locationCreatedAt,
    Color? containerItemColor,
    required Function() onTap,
  }) =>
      DeviceLocationItem(
        locationName: locationName,
        locationHouseholdId: locationHouseholdId,
        locationCreatedAt: locationCreatedAt,
        containerItemColor: containerItemColor,
        onTap: onTap,
      );
  static Widget addDeviceLocationModal() => AddDeviceLocationModal();
  static Widget editDeviceLocationModal({
    required deviceLocationId,
    required deviceLocationName,
    required deviceHouseholdId,
    required updatedBy,
  }) =>
      EditDeviceLocationModal(
        deviceLocationId: deviceLocationId,
        deviceLocationName: deviceLocationName,
        deviceHouseholdId: deviceHouseholdId,
      );
  static Widget deleteDeviceLocationModal({
    required deviceLocationId,
    required deletedBy,
  }) =>
      DeleteDeviceLocationModal(
        deviceLocationId: deviceLocationId,
      );
}
