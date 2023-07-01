import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/view/forget_password_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    String password;
    String confirmpassword;
    UsersDB usersDBList = Provider.of<UsersDB>(context);
    void changePasswordHandler() {
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
                width: ForgetPasswordStyles.logoWidth,
                height: ForgetPasswordStyles.logoHeight,
                margin: ForgetPasswordStyles.logoMargin,
                child: Image.asset('assets/logo/HydroSense_logo_nobg.png'),
              ),
              //* Change PW Text
              Container(
                margin: ForgetPasswordStyles.titleContainerMargin,
                alignment: ForgetPasswordStyles.titleAlign,
                child: const Text(
                  'Change Password',
                  textAlign: TextAlign.left,
                  style: ForgetPasswordStyles.title,
                ),
              ),
              //* Password TextBox
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SharedWidgets.inputTextBox(
                  textLabel: 'Password',
                  onChanged: (text) {
                    debugPrint(text);
                    password = text;
                  },
                  obscureTextEnabled: true,
                ),
              ),
              //* Confirm Password TextBox
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SharedWidgets.inputTextBox(
                  textLabel: 'Confirm Password',
                  onChanged: (text) {
                    debugPrint(text);
                    confirmpassword = text;
                  },
                  obscureTextEnabled: true,
                ),
              ),
              //* Submit Button
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: ElevatedButton.icon(
                    onPressed: changePasswordHandler,
                    style: const ButtonStyle(
                      enableFeedback: true,
                      backgroundColor: MaterialStatePropertyAll(
                          Color(ForgetPasswordStyles.buttonColor)),
                      fixedSize: MaterialStatePropertyAll(
                          ForgetPasswordStyles.buttonSize),
                      textStyle: MaterialStatePropertyAll(
                          ForgetPasswordStyles.buttonText),
                    ),
                    label: const Text('Update Password',
                        style: ForgetPasswordStyles.buttonText),
                    icon: const Icon(
                      Icons.lock_reset_rounded,
                      color: ForgetPasswordStyles.iconColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
