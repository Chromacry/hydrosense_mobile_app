import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device_location.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class DeviceLocationsDB with ChangeNotifier {
  //* Data list
  List<DeviceLocation> device_locations = [
    DeviceLocation(
      id: 'dwadwawadwdadwadwa',
      device_location_name: 'Kitchen',
      household_id: GlobalConstants.temp_householdID,
      created_by: 'System',
      created_at: 'Now',
    ),
    DeviceLocation(
      id: '2323adwadwasdaw',
      device_location_name: 'Bathroom',
      household_id: GlobalConstants.temp_householdID,
      created_by: 'System',
      created_at: 'Now',
    ),
    DeviceLocation(
      id: '2323a32aaaa',
      device_location_name: 'Guest Bathroom',
      household_id: GlobalConstants.temp_householdID,
      created_by: 'System',
      created_at: 'Now',
    ),
  ];

  List<DeviceLocation> getAllDeviceLocations() {
    return device_locations;
  }

  List<DeviceLocation> getAllDeviceLocationsByHouseholdId({householdId}) {
    List<DeviceLocation> householdDeviceLocations = [];
    for (DeviceLocation currentDeviceLocation in device_locations) {
      if (currentDeviceLocation.household_id == householdId)
        householdDeviceLocations.add(currentDeviceLocation);
    }
    return householdDeviceLocations;
  }

  DeviceLocation getDeviceLocationById({deviceLocationId}) {
    DeviceLocation deviceData = DeviceLocation(id: deviceLocationId);
    for (DeviceLocation currentDevice in device_locations) {
      if (currentDevice.id == deviceLocationId) deviceData = currentDevice;
    }
    return deviceData;
  }

  void addDeviceLocation(
      {deviceLocationName, deviceHouseholdId, createdBy, createdAt}) {
    DeviceLocation deviceLocationData = DeviceLocation(
      id: uuid.v4(),
      device_location_name: deviceLocationName,
      household_id: deviceHouseholdId,
      created_at: createdAt,
      created_by: createdBy ?? 'system',
    );
    device_locations.add(deviceLocationData);
    notifyListeners();
  }

  void updateDeviceLocationById({
    deviceLocationId,
    deviceLocationName,
    householdId,
    updatedBy,
    updatedAt,
  }) {
    int deviceLocationIndex = device_locations
        .indexWhere((element) => element.id == deviceLocationId);
    if (deviceLocationIndex != -1) {
      DeviceLocation currentDeviceLocation =
          device_locations[deviceLocationIndex];
      currentDeviceLocation.id = deviceLocationId;
      currentDeviceLocation.device_location_name = deviceLocationName;
      currentDeviceLocation.household_id = householdId;
      currentDeviceLocation.updated_by = updatedBy;
      currentDeviceLocation.updated_at = updatedAt;
      notifyListeners();
    }
  }

  void deleteDeviceLocationById({
    deviceLocationId,
    deviceLocationName,
    householdId,
    deletedBy,
    deletedAt,
  }) {
    int deviceLocationIndex = device_locations
        .indexWhere((element) => element.id == deviceLocationId);
    device_locations[deviceLocationIndex] = DeviceLocation(
      deleted_by: deletedBy,
      deleted_at: deletedAt,
    );
    notifyListeners();
  }

  void removeDeviceLocationById(deviceLocationId) {
    device_locations.removeAt(device_locations
        .indexWhere((element) => element.id == deviceLocationId));
    notifyListeners();
  }
}
