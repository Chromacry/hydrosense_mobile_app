import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:provider/provider.dart';

class DeleteDeviceLocationModal extends StatefulWidget {
  final String deviceLocationId;
  DeleteDeviceLocationModal({
    Key? key,
    required this.deviceLocationId,
  }) : super(key: key);

  @override
  State<DeleteDeviceLocationModal> createState() => _DeleteDeviceModalState();
}

class _DeleteDeviceModalState extends State<DeleteDeviceLocationModal> {
  @override
  Widget build(BuildContext context) {
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);
    String deviceLocationHouseholdIdValue = GlobalConstants
        .temp_householdID; //! need to get household ID from current user
    String deletedBy =
        'Patrica Chew'; //! need to get created by from current user

    void onSubmitDeleteDevice() {
      String dateNow = DateTime.now()
          .toString()
          .substring(0, 19); //* Substring to remove milliseconds
      deviceLocationsDB.deleteDeviceLocationById(
        deviceLocationId: widget.deviceLocationId,
        deletedBy: deletedBy,
        deletedAt: dateNow,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Device deleted successfully!')),
      );
      Navigator.pop(context);
    }

    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      titlePadding: EdgeInsets.only(top: 20, left: 10, right: 10),
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text('Delete Device Location',
              style: DeleteDevicsStyles.deleteDeviceTitle),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to delete this device location?',
        style: DeleteDevicsStyles.deleteDeviceText,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSubmitDeleteDevice,
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}

class DeleteDevicsStyles {
  //* Devices Modal title
  static TextStyle deleteDeviceTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //* Devices Box
  static const devicesBoxColor = DesignConstants.COLOR_DARKGRAY_SECONDARY;

  //* Devices Modal sub title
  static TextStyle deleteDeviceText = TextStyle(
    fontSize: 16,
    color: Colors.red,
  );
}
