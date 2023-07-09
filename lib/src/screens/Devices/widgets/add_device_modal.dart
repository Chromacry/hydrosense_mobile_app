import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device_location.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class AddDeviceModal extends StatefulWidget {
  AddDeviceModal({super.key});

  @override
  State<AddDeviceModal> createState() => _AddDeviceModalState();
}

class _AddDeviceModalState extends State<AddDeviceModal> {
  final _addDeviceFormKey = GlobalKey<FormState>();
  String? dropdownLocationSelectedValue;
  String? deviceIdValue;
  String? deviceNameValue;
  String? deviceSerialNumberValue;
  String? deviceLocationIdValue;
  bool isDeviceLocationEmpty = false;

  String deviceHouseholdIdValue = GlobalConstants
      .temp_householdID; //! need to get household ID from current user
  String createdBy =
      'Patrica Chew'; //! need to get created by from current user

  @override
  Widget build(BuildContext context) {
    DevicesDB devicesDB = Provider.of<DevicesDB>(context);
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);
    List<DeviceLocation> deviceLocationsList =
        deviceLocationsDB.getAllDeviceLocationsByHouseholdId(
            householdId: GlobalConstants.temp_householdID);

    List<List<String>> dropdownLocationOptions =
        deviceLocationsList.map((currentLocationValues) {
      return [
        currentLocationValues.id ?? '',
        currentLocationValues.device_location_name ?? '',
      ];
    }).toList();

    //* Onchnage values
    dynamic onChangeDeviceId = (value) => deviceIdValue = value;
    dynamic onChangeDeviceName = (value) => deviceNameValue = value;
    dynamic onChangeDeviceSerialNumber =
        (value) => deviceSerialNumberValue = value;
    dynamic onChangeDeviceLocationId = (value) {
      //* Refresh for dropdown widget
      setState(() {
        deviceLocationIdValue = value;
        dropdownLocationSelectedValue = value;
      });
    };

    //*  validators
    dynamic deviceNameValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Device Name is empty!';
      }
      return null;
    };
    dynamic deviceSerialNumberValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Device Serial Number is empty!';
      }
      return null;
    };

    void onSubmitAddDevice() {
      if (_addDeviceFormKey.currentState!.validate()) {
        //* Check if location dropdown has value
        if (dropdownLocationSelectedValue == null) {
          isDeviceLocationEmpty = true;
          setState(() {});
          Timer(Duration(milliseconds: 1500), () {
            isDeviceLocationEmpty = false;
            setState(() {});
          });
          return;
        }

        devicesDB.addDevice(
          deviceId: deviceIdValue,
          deviceName: deviceNameValue,
          deviceSerialNumber: deviceSerialNumberValue,
          deviceHouseholdId: deviceHouseholdIdValue,
          deviceLocationId: deviceLocationIdValue,
          createdBy: createdBy,
          createdAt: DateTimeUtil.getCurrentDateTime(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          StatusSnackbar.snackbarStatus(
              textMessage: 'Successfully added Device!'),
        );
        Navigator.pop(context);
      }
    }

    return SimpleDialog(
      contentPadding: EdgeInsets.all(20),
      titlePadding: EdgeInsets.only(top: 20, left: 10, right: 10),
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text('Add Device', style: AddDevicsStyles.addDeviceTitle),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ],
      ),
      children: [
        SingleChildScrollView(
          child: Form(
            key: _addDeviceFormKey,
            child: Column(
              children: <Widget>[
                //* Sub Title Information
                Container(
                  padding: AddDevicsStyles.titleContainerPadding,
                  margin: AddDevicsStyles.titleContainerMargin,
                  alignment: AddDevicsStyles.titleAlign,
                  child: const Text(
                    'Information',
                    textAlign: TextAlign.left,
                    style: AddDevicsStyles.addDeviceSubTitle,
                  ),
                ),
                //* Device Name textbox
                InputTextBox(
                  inputTextLabelValue: 'Device Name',
                  allColorAttributes: Colors.white,
                  onChanged: onChangeDeviceName,
                  validator: deviceNameValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                //* Details
                Container(
                  padding: AddDevicsStyles.titleContainerPadding,
                  margin: AddDevicsStyles.titleContainerMargin,
                  alignment: AddDevicsStyles.titleAlign,
                  child: const Text(
                    'Details',
                    textAlign: TextAlign.left,
                    style: AddDevicsStyles.addDeviceSubTitle,
                  ),
                ),
                InputTextBox(
                  inputTextLabelValue: 'Device UUID',
                  allColorAttributes: Colors.white,
                  onChanged: onChangeDeviceId,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputTextBox(
                  inputTextLabelValue: 'Device Serial Number',
                  allColorAttributes: Colors.white,
                  onChanged: onChangeDeviceSerialNumber,
                  validator: deviceSerialNumberValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                //* Device Location sub title
                Container(
                  padding: AddDevicsStyles.titleContainerPadding,
                  margin: AddDevicsStyles.titleContainerMargin,
                  alignment: AddDevicsStyles.titleAlign,
                  child: const Text(
                    'Device Location',
                    textAlign: TextAlign.left,
                    style: AddDevicsStyles.addDeviceSubTitle,
                  ),
                ),
                //* Device location dropdownbox
                DropdownTextBox(
                  options: dropdownLocationOptions,
                  hintText: 'Select location of device',
                  onChanged: onChangeDeviceLocationId,
                  selectedValue: dropdownLocationSelectedValue,
                ),
                //* show if empty locaiton device
                isDeviceLocationEmpty
                    ? Text('Device location is empty!',
                        style: TextStyle(color: Colors.red))
                    : Container(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // * Cancel or Submit button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onSubmitAddDevice,
              child: const Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}

class AddDevicsStyles {
  //* Title Text
  static const Alignment titleAlign = Alignment.centerLeft;
  static const EdgeInsets titleContainerMargin = EdgeInsets.only(bottom: 20);
  static const EdgeInsets titleContainerPadding = EdgeInsets.only(top: 20);
  //* Devices Modal title
  static const addDeviceTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //* Devices Box
  static const devicesBoxColor = DesignConstants.COLOR_DARKGRAY_SECONDARY;

  //* Devices Modal sub title
  static const addDeviceSubTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
