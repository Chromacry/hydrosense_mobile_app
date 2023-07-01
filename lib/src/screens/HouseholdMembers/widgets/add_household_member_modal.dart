import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class AddHouseholdMemberModal extends StatelessWidget {
  AddHouseholdMemberModal({super.key});

  final _addHouseholdMemberFormKey = GlobalKey<FormState>();
  String? userName;
  String? emailAddress;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    UsersDB usersDB = Provider.of<UsersDB>(context);

    dynamic onChangeUsername = (value) => userName = value;
    dynamic onChangeEmailAddress = (value) => emailAddress = value;
    dynamic onChangePhoneNumber = (value) => phoneNumber = value;
    dynamic onChangePassword = (value) => password = value;
    dynamic onChangeConfirmPassword = (value) => confirmPassword = value;


    void onSubmitAddMember() {
      if (_addHouseholdMemberFormKey.currentState!.validate()) {
        usersDB.addUser(
            userName: userName,
            emailAddress: emailAddress,
            phoneNo: phoneNumber,
            householdId: GlobalConstants.temp_householdID,
            roleId: 'Household User',
            createdBy: 'Patricia Chew');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully added member!')),
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
          const Text('Add Member', style: AddDevicsStyles.addDeviceTitle),
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
              key: _addHouseholdMemberFormKey,
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
                  //* Usernane textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Username',
                    inputTextValue: userName,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeUsername,
                    validator: deviceLocationNameValidator,
                  ),
                  //* Email textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Email Address',
                    inputTextValue: emailAddress,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeEmailAddress,
                    validator: deviceLocationNameValidator,
                  ),
                  //* Phone number textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Phone Number',
                    inputTextValue: phoneNumber,
                    allColorAttributes: Colors.white,
                    onChanged: onChangePhoneNumber,
                    validator: deviceLocationNameValidator,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //* Sub Title Security
                  Container(
                    padding: AddDevicsStyles.titleContainerPadding,
                    margin: AddDevicsStyles.titleContainerMargin,
                    alignment: AddDevicsStyles.titleAlign,
                    child: const Text(
                      'Security',
                      textAlign: TextAlign.left,
                      style: AddDevicsStyles.addDeviceSubTitle,
                    ),
                  ),
                  //* Password textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Password',
                    inputTextValue: password,
                    allColorAttributes: Colors.white,
                    obscureTextEnabled: true,
                    onChanged: onChangePassword,
                    validator: deviceLocationNameValidator,
                  ),
                  //* Confirm Password textbox
                  SharedWidgets.inputTextBox(
                    textLabel: 'Confirm Password',
                    inputTextValue: confirmPassword,
                    obscureTextEnabled: true,
                    allColorAttributes: Colors.white,
                    onChanged: onChangeConfirmPassword,
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
              onPressed: onSubmitAddMember,
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
