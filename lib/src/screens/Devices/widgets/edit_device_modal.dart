import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:provider/provider.dart';

class EditDeviceModal extends StatefulWidget {
  final String deviceId;
  final String deviceName;
  final String deviceSerialNumber;
  final String deviceHouseholdId;
  final String deviceLocationId;
  final List<List<String>> dropdownLocationOptions;
  EditDeviceModal({
    Key? key,
    required this.deviceId,
    required this.deviceName,
    required this.deviceSerialNumber,
    required this.deviceHouseholdId,
    required this.deviceLocationId,
    required this.dropdownLocationOptions,
  }) : super(key: key);
  @override
  State<EditDeviceModal> createState() => _EditDeviceModalState();
}

class _EditDeviceModalState extends State<EditDeviceModal> {
  final _editDeviceFormKey = GlobalKey<FormState>();
  String? dropdownLocationSelectedValue;
  String? deviceIdValue;
  String? deviceNameValue;
  String? deviceSerialNumberValue;
  String? deviceLocationIdValue;
  @override
  void initState() {
    super.initState();
    deviceIdValue = widget.deviceId;
    dropdownLocationSelectedValue = widget.deviceLocationId;
    deviceNameValue = widget.deviceName;
    deviceSerialNumberValue = widget.deviceSerialNumber;
    deviceLocationIdValue = widget.deviceLocationId;
  }

  @override
  Widget build(BuildContext context) {
    DevicesDB devicesDB = Provider.of<DevicesDB>(context);
    String deviceHouseholdIdValue = GlobalConstants
        .temp_householdID; //! need to get household ID from current user
    String updatedBy =
        'Patrica Chew'; //! need to get created by from current user

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

    void onSubmitEditDevice() {
      if (_editDeviceFormKey.currentState!.validate()) {
        devicesDB.updateDeviceById(
          deviceId: deviceIdValue,
          deviceName: deviceNameValue,
          deviceSerialNumber: deviceSerialNumberValue,
          householdId: deviceHouseholdIdValue,
          deviceLocationId: deviceLocationIdValue,
          updatedBy: updatedBy,
          updatedAt: DateTimeUtil.getCurrentDateTime(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Updating Device Info...')),
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
          const Text('Edit Device', style: EditDevicsStyles.addDeviceTitle),
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
        Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Form(
              key: _editDeviceFormKey,
              child: Column(
                children: <Widget>[
                  //* Sub Title Information
                  Container(
                    padding: EditDevicsStyles.titleContainerPadding,
                    margin: EditDevicsStyles.titleContainerMargin,
                    alignment: EditDevicsStyles.titleAlign,
                    child: const Text(
                      'Information',
                      textAlign: TextAlign.left,
                      style: EditDevicsStyles.addDeviceSubTitle,
                    ),
                  ),
                  //* Device Name textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Device Name',
                    inputTextValue: deviceNameValue,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeDeviceName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Device Name is empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //* Details
                  Container(
                    padding: EditDevicsStyles.titleContainerPadding,
                    margin: EditDevicsStyles.titleContainerMargin,
                    alignment: EditDevicsStyles.titleAlign,
                    child: const Text(
                      'Details',
                      textAlign: TextAlign.left,
                      style: EditDevicsStyles.addDeviceSubTitle,
                    ),
                  ),
                  SharedWidgets.inputTextBox(
                    textLabel: 'Device UUID',
                    inputTextValue: deviceIdValue,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeDeviceId,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SharedWidgets.inputTextBox(
                    textLabel: 'Device Serial Number',
                    inputTextValue: deviceSerialNumberValue,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeDeviceSerialNumber,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //* Device Location sub title
                  Container(
                    padding: EditDevicsStyles.titleContainerPadding,
                    margin: EditDevicsStyles.titleContainerMargin,
                    alignment: EditDevicsStyles.titleAlign,
                    child: const Text(
                      'Device Location',
                      textAlign: TextAlign.left,
                      style: EditDevicsStyles.addDeviceSubTitle,
                    ),
                  ),
                  //* Device location dropdownbox
                  SharedWidgets.dropdownTextBox(
                    options: widget.dropdownLocationOptions,
                    hintText: 'Select location of device',
                    onChanged: onChangeDeviceLocationId,
                    selectedValue: dropdownLocationSelectedValue,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
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
              onPressed: onSubmitEditDevice,
              child: const Text('Update'),
            ),
          ],
        ),
      ],
    );
  }
}

class EditDevicsStyles {
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
