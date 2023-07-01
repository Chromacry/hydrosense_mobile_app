import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class EditHouseholdMemberModal extends StatefulWidget {
  final String userId;
  final String userName;
  final String emailAddress;
  final String phoneNumber;
  final String householdId;

  EditHouseholdMemberModal({
    Key? key,
    required this.userId,
    required this.userName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.householdId,
  }) : super(key: key);

  @override
  State<EditHouseholdMemberModal> createState() =>
      _EditHouseholdMemberModalState();
}

class _EditHouseholdMemberModalState extends State<EditHouseholdMemberModal> {
  final _editHouseholdMemberFormKey = GlobalKey<FormState>();
  String? userName;
  String? emailAddress;
  String? phoneNumber;

  void initState() {
    super.initState();
    userName = widget.userName;
    emailAddress = widget.emailAddress;
    phoneNumber = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    UsersDB usersDB = Provider.of<UsersDB>(context);

    //* validators
    dynamic userNameValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Username is empty!';
      }
      return null;
    };

    dynamic emailAddressValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Email Address is empty!';
      }
      return null;
    };

    dynamic phoneNumberValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Phone Number is empty!';
      }
      return null;
    };

    dynamic onChangedUserName = (value) {
      userName = value;
      //* Refresh widget
      setState(() {});
    };

    dynamic onChangedEmailAddress = (value) {
      userName = value;
      //* Refresh widget
      setState(() {});
    };

    dynamic onChangedPhoneNumber = (value) {
      phoneNumber = value;
      //* Refresh widget
      setState(() {});
    };

    void onSubmitEditHouseholdMember() {
      if (_editHouseholdMemberFormKey.currentState!.validate()) {
        usersDB.updateUserInfoById(
          userId: widget.userId,
          emailAddress: emailAddress,
          phoneNo: phoneNumber,
          userName: userName,
          updatedBy: 'Patrica Chew',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Successfully updated household member Info!')),
        );
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Edit Household Member',
            style: EditHouseholdMemberStyles.editDeviceTitle,
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
            key: _editHouseholdMemberFormKey,
            child: Column(
              children: <Widget>[
                //* Sub Title Information
                Container(
                  padding: EditHouseholdMemberStyles.titleContainerPadding,
                  margin: EditHouseholdMemberStyles.titleContainerMargin,
                  alignment: EditHouseholdMemberStyles.titleAlign,
                  child: const Text(
                    'Information',
                    textAlign: TextAlign.left,
                    style: EditHouseholdMemberStyles.addDeviceSubTitle,
                  ),
                ),
                //* Usernane textbox
                SharedWidgets.inputTextBox(
                  textLabel: 'Username',
                  inputTextValue: widget.userName,
                  allColorAttributes: Colors.white,
                  onChanged: onChangedUserName,
                  validator: userNameValidator,
                ),
                //* Email textbox
                SharedWidgets.inputTextBox(
                  textLabel: 'Email Address',
                  inputTextValue: widget.emailAddress,
                  allColorAttributes: Colors.white,
                  onChanged: onChangedEmailAddress,
                  validator: emailAddressValidator,
                ),
                //* Phone number textbox
                SharedWidgets.inputTextBox(
                  textLabel: 'Phone Number',
                  inputTextValue: widget.phoneNumber,
                  allColorAttributes: Colors.white,
                  onChanged: onChangedPhoneNumber,
                  validator: phoneNumberValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                //* Sub Title Information
                Container(
                  padding: EditHouseholdMemberStyles.titleContainerPadding,
                  margin: EditHouseholdMemberStyles.titleContainerMargin,
                  alignment: EditHouseholdMemberStyles.titleAlign,
                  child: const Text(
                    'Security',
                    textAlign: TextAlign.left,
                    style: EditHouseholdMemberStyles.addDeviceSubTitle,
                  ),
                ),
                //* Password textbox

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
          onPressed: onSubmitEditHouseholdMember,
          child: const Text('Update'),
        ),
      ],
    );
  }
}

class EditHouseholdMemberStyles {
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
