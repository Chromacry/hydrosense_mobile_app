import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class EditDeviceLocationModal extends StatefulWidget {
  final String deviceLocationId;
  final String deviceLocationName;
  final String deviceHouseholdId;

  EditDeviceLocationModal({
    Key? key,
    required this.deviceLocationId,
    required this.deviceLocationName,
    required this.deviceHouseholdId,
  }) : super(key: key);

  @override
  State<EditDeviceLocationModal> createState() =>
      _EditDeviceLocationModalState();
}

class _EditDeviceLocationModalState extends State<EditDeviceLocationModal> {
  final _editDeviceLocationFormKey = GlobalKey<FormState>();
  String? deviceLocationName;

  void initState() {
    super.initState();
    deviceLocationName = widget.deviceLocationName;
  }

  @override
  Widget build(BuildContext context) {
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);

    //* Device Location Name validator
    dynamic deviceLocationNameValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Device Location Name is empty!';
      }
      return null;
    };

    dynamic onChangedDeviceLocationName = (value) {
      deviceLocationName = value;
      //* Refresh widget
      setState(() {});
    };

    void onSubmitEditDeviceLocation() {
      String dateNow = DateTime.now()
          .toString()
          .substring(0, 19); //* Substring to remove milliseconds
      if (_editDeviceLocationFormKey.currentState!.validate()) {
        String? status = deviceLocationsDB.updateDeviceLocationById(
          deviceLocationId: widget.deviceLocationId,
          deviceLocationName: deviceLocationName,
          householdId: widget.deviceHouseholdId,
          updatedAt: dateNow,
          updatedBy: 'Patricccccca chew',
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(SharedWidgets.statusSnackbar(textMessage: status));
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Edit Device Location',
            style: EditDevicsStyles.editDeviceTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ],
      ),
      content: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Form(
            key: _editDeviceLocationFormKey,
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
                  textLabel: 'Device Location Name',
                  inputTextValue: widget.deviceLocationName,
                  allColorAttributes: Colors.white,
                  onChanged: onChangedDeviceLocationName,
                  validator: deviceLocationNameValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSubmitEditDeviceLocation,
          child: const Text('Update'),
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
  static const editDeviceTitle = TextStyle(
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
