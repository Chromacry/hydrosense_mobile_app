import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:provider/provider.dart';

class DeleteHouseholdMemberModal extends StatefulWidget {
  final String userId;
  DeleteHouseholdMemberModal({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<DeleteHouseholdMemberModal> createState() =>
      _DeleteeHouseholdMemberModalState();
}

class _DeleteeHouseholdMemberModalState
    extends State<DeleteHouseholdMemberModal> {
  @override
  Widget build(BuildContext context) {
    UsersDB usersDB = Provider.of<UsersDB>(context);

    void onSubmitDeleteDevice() {
      usersDB.deleteUserById(
        userId: widget.userId,
        deletedBy: 'Patrica Chew',
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully deleted member!')),
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
