import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class DevicesDB with ChangeNotifier {
  //* Data list
  List<Device> devices = [
    Device(
        id: 'dwadwawadwdadwadwa',
        device_household_id: GlobalConstants.temp_householdID,
        device_location_id: '1',
        device_serialnumber: 'SN123456789WTS',
        device_name: 'I love DSAG',
        created_by: 'System',
        created_at: 'Now'),
  ];

  List<Device> getAllDevices() {
    return devices;
  }

  List<Device> getAllDevicesByHouseholdId(householdId) {
    List<Device> householdDevices = [];
    for (var currentDevice in devices) {
      if (currentDevice.device_household_id == householdId)
        householdDevices.add(currentDevice);
    }
    return householdDevices;
  }

  Device getDeviceById(deviceId) {
    Device deviceData = Device(id: deviceId);
    for (var currentDevice in devices) {
      if (currentDevice.id == deviceId) deviceData = currentDevice;
    }
    return deviceData;
  }

  void addDevice(deviceId, deviceName, deviceSerialNumber, deviceHouseholdId,
      deviceLocationId, createdBy, createdAt) {
    Device deviceData = Device(
      id: deviceId ?? uuid.v4(),
      device_name: deviceName,
      device_serialnumber: deviceSerialNumber,
      device_household_id: deviceHouseholdId,
      device_location_id: deviceLocationId,
      created_at: createdAt,
      created_by: createdBy ?? 'system',
    );
    devices.add(deviceData);
    notifyListeners();
  }

  void updateDeviceById(id, deviceName, deviceSerialNumber, householdId,
      deviceLocationId, updatedBy) {
    int deviceIndex = devices.indexWhere((element) => element.id == id);
    debugPrint(deviceIndex.toString());
    devices[deviceIndex] = Device(
        device_name: deviceName,
        device_serialnumber: deviceSerialNumber,
        device_household_id: householdId,
        device_location_id: deviceLocationId,
        updated_by: updatedBy,
        updated_at: '');
    notifyListeners();
  }

  void removeDeviceById(deviceId) {
    devices.removeAt(devices.indexWhere((element) => element.id == deviceId));
    notifyListeners();
  }
}
