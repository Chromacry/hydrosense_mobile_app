import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class DevicesDB with ChangeNotifier {
  //* Data list
  List<Device> devices = [
    Device(
      id: 'deviceabc12321UUID',
      device_household_id: GlobalConstants.temp_householdID,
      device_location_id: '2323adwadwasdaw',
      device_serialnumber: 'SN123456789WTS',
      device_name: 'Sink Tap',
      created_by: 'System',
      created_at: '2023-07-03 00:00:00',
    ),
  ];

  List<Device> getAllDevices() {
    return devices;
  }

  List<Device> getAllDevicesByHouseholdId({householdId}) {
    List<Device> householdDevices = [];
    for (Device currentDevice in devices) {
      if (currentDevice.device_household_id == householdId &&
          currentDevice.deleted_at == null) householdDevices.add(currentDevice);
    }
    return householdDevices;
  }

  //*Check if the device is tagged to location
  bool getDeviceByLocationId(String locationId) {
    for (Device currentDevice in devices) {
      if (currentDevice.device_location_id == locationId) {
        return true;
      }
    }
    return false;
  }

  Device getDeviceById({deviceId}) {
    Device deviceData = Device(id: deviceId);
    for (Device currentDevice in devices) {
      if (currentDevice.id == deviceId) deviceData = currentDevice;
    }
    return deviceData;
  }

  void addDevice(
      {deviceId,
      deviceName,
      deviceSerialNumber,
      deviceHouseholdId,
      deviceLocationId,
      createdBy,
      createdAt}) {
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

  void updateDeviceById({
    deviceId,
    deviceName,
    deviceSerialNumber,
    householdId,
    deviceLocationId,
    updatedBy,
    updatedAt,
  }) {
    int deviceIndex = devices.indexWhere((element) => element.id == deviceId);
    if (deviceIndex != -1) {
      Device currentDevice = devices[deviceIndex];
      currentDevice.device_name = deviceName;
      currentDevice.device_serialnumber = deviceSerialNumber;
      currentDevice.device_household_id = householdId;
      currentDevice.device_location_id = deviceLocationId;
      currentDevice.updated_by = updatedBy;
      currentDevice.updated_at = updatedAt;
      notifyListeners();
    }
  }

  void deleteDeviceById({
    deviceId,
    deletedBy,
    deletedAt,
  }) {
    int deviceIndex = devices.indexWhere((element) => element.id == deviceId);
    if (deviceIndex != -1) {
      Device currentDevice = devices[deviceIndex];
      currentDevice.deleted_by = deletedBy;
      currentDevice.deleted_at = deletedAt;
      notifyListeners();
    }
  }

  void removeDeviceById(deviceId) {
    devices.removeAt(devices.indexWhere((element) => element.id == deviceId));
    notifyListeners();
  }
}
