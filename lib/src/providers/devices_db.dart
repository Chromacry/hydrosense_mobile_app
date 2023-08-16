import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();
final CollectionReference<Map<String, dynamic>> firestoreDB =
    FirebaseFirestore.instance.collection('devices');

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

  Stream<List<Device>> getAllDevices() {
    return firestoreDB.snapshots().map((snapshot) => snapshot.docs
        .map<Device>((doc) => Device.fromMap(doc.data(), doc.id))
        .toList());
  }

  Stream<List<Device>> getAllDevicesByHouseholdId({householdId}) {
    Stream<List<Device>> allDevicesStream = getAllDevices();
    //* Check for household id
    Stream<List<Device>> filteredDevicesStream = allDevicesStream.map(
      (allDevices) => allDevices
          .where((currentDevice) =>
              currentDevice.device_household_id == householdId)
          .toList(),
    );
    return filteredDevicesStream;
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

  // Stream<Device> getDeviceById({deviceId}) {
  //   // Device deviceData = Device(id: deviceId);
  //   // for (Device currentDevice in devices) {
  //   //   if (currentDevice.id == deviceId) deviceData = currentDevice;
  //   // }
  //   // return deviceData;
  //   return firestoreDB.where("id", isEqualTo: deviceId).get();
  // }

  Future<DocumentReference<Map<String, dynamic>>> addDevice(
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
    return firestoreDB.add({
      'id': deviceData.id,
      'device_name': deviceData.device_name,
      'device_serialnumber': deviceData.device_serialnumber,
      'device_household_id': deviceData.device_household_id,
      'device_location_id': deviceData.device_location_id,
      'created_at': deviceData.created_at,
      'created_by': deviceData.created_by,
    });
  }

  Future<void> updateDeviceById({
    deviceId,
    deviceName,
    deviceSerialNumber,
    householdId,
    deviceLocationId,
    updatedBy,
    updatedAt,
  }) {
    // int deviceIndex = devices.indexWhere((element) => element.id == deviceId);
    // if (deviceIndex != -1) {
    //   Device currentDevice = devices[deviceIndex];
    //   currentDevice.device_name = deviceName;
    //   currentDevice.device_serialnumber = deviceSerialNumber;
    //   currentDevice.device_household_id = householdId;
    //   currentDevice.device_location_id = deviceLocationId;
    //   currentDevice.updated_by = updatedBy;
    //   currentDevice.updated_at = updatedAt;
    //   notifyListeners();
    // }
    return firestoreDB.doc(deviceId).update({
      'device_name': deviceName,
      'device_serialnumber': deviceSerialNumber,
      'device_household_id': householdId,
      'device_location_id': deviceLocationId,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
    });
  }

  Future<void> deleteDeviceById({
    deviceId,
    deletedBy,
    deletedAt,
  }) {
    return firestoreDB.doc(deviceId).delete();
  }

  void removeDeviceById(deviceId) {
    devices.removeAt(devices.indexWhere((element) => element.id == deviceId));
    notifyListeners();
  }
}
