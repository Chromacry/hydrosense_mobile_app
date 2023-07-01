import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/view/forget_password_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/UpdateInfo/view/update_info_style.dart';
import 'package:provider/provider.dart';

class UpdateInfoView extends StatelessWidget {
  const UpdateInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    String emailAddress;
    String phoneNumber;
    UsersDB usersDBList = Provider.of<UsersDB>(context);
    void updateInfoHandler() {
      //! Change the below method to check user exist then send email to reset password.
      // usersDBList.updateUserByEmail('defaultUsername', emailaddress, '12345678');
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              //* Logo
              Container(
                width: UpdateInfoStyles.logoWidth,
                height: UpdateInfoStyles.logoHeight,
                margin: UpdateInfoStyles.logoMargin,
                child: Image.asset('assets/logo/HydroSense_logo_nobg.png'),
              ),
              //* Change PW Text
              Container(
                margin: UpdateInfoStyles.titleContainerMargin,
                alignment: UpdateInfoStyles.titleAlign,
                child: const Text(
                  'Update Info',
                  textAlign: TextAlign.left,
                  style: UpdateInfoStyles.title,
                ),
              ),
              //* Password TextBox
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SharedWidgets.inputTextBox(
                  textLabel: 'Email Address',
                  onChanged: (text) {
                    debugPrint(text);
                    emailAddress = text;
                  },
                  obscureTextEnabled: true,
                ),
              ),
              //* Confirm Password TextBox
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SharedWidgets.inputTextBox(
                  textLabel: 'Phone Number',
                  onChanged: (text) {
                    debugPrint(text);
                    phoneNumber = text;
                  },
                  obscureTextEnabled: true,
                ),
              ),
              //* Submit Button
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: ElevatedButton.icon(
                  onPressed: updateInfoHandler,
                  style: const ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStatePropertyAll(
                        Color(UpdateInfoStyles.buttonColor)),
                    fixedSize:
                        MaterialStatePropertyAll(UpdateInfoStyles.buttonSize),
                    textStyle:
                        MaterialStatePropertyAll(UpdateInfoStyles.buttonText),
                  ),
                  label: const Text('Update Info',
                      style: UpdateInfoStyles.buttonText),
                  icon: const Icon(
                    Icons.update_rounded,
                    color: UpdateInfoStyles.iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}