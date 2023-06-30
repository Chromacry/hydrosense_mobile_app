import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class AddDeviceLocationModal extends StatelessWidget {
  AddDeviceLocationModal({super.key});

  final _addDeviceLocationFormKey = GlobalKey<FormState>();
  String? deviceLocationNameValue;
  String deviceHouseholdIdValue = GlobalConstants
      .temp_householdID; //! need to get household ID from current user
  String createdBy =
      'Patrica Chew'; //! need to get created by from current user
  @override
  Widget build(BuildContext context) {
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);

    dynamic onChangeDeviceName = (value) => deviceLocationNameValue = value;
    void onSubmitAddDevice() {
      //* Get current DateTime
      String dateNow = DateTime.now()
          .toString()
          .substring(0, 19); //* Substring to remove milliseconds
      if (_addDeviceLocationFormKey.currentState!.validate()) {
        deviceLocationsDB.addDeviceLocation(
          deviceLocationName: deviceLocationNameValue,
          deviceHouseholdId: deviceHouseholdIdValue,
          createdBy: createdBy,
          createdAt: dateNow,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Adding DeviceLocation...')),
        );
        Navigator.pop(context);
      }
    }

    //* Device Location Name validator
    dynamic deviceLocationNameValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Device Location Name is empty!';
      }
      return null;
    };

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
          const Text('Add Device Location',
              style: AddDevicsStyles.addDeviceTitle),
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
              key: _addDeviceLocationFormKey,
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
                  SharedWidgets.inputTextBox(
                    textLabel: 'Device Location Name',
                    allColorAttributes: Colors.white,
                    onChanged: onChangeDeviceName,
                    validator: deviceLocationNameValidator,
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
