import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/view/forget_password_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:hydrosense_mobile_app/src/services/firebase_auth/auth_service.dart';
import 'package:provider/provider.dart';

AuthService authService = new AuthService();

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final _changePasswordFormKey = GlobalKey<FormState>();
    String password = '';
    String confirmpassword = '';
    UsersDB usersDBList = Provider.of<UsersDB>(context);

    dynamic onChangePassword(value) => password = value;
    dynamic onChangeConfirmPassword(value) => confirmpassword = value;

    //* validator
    dynamic passwordValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Password is empty!';
      }
      if (value != confirmpassword) return 'Password do not match!';
    };
    dynamic confirmPasswordValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Confirm Password is empty!';
      }
      if (value != password) return 'Password do not match!';
    };

    void changePasswordHandler() {
      if (_changePasswordFormKey.currentState!.validate()) {
        authService
            .changePassword(password: password)
            .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
              StatusSnackbar.snackbarStatus(
                  textMessage: 'Successfully Updated Password!'));
            })
            .catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
              StatusSnackbar.snackbarStatus(
                  textMessage: error.toString()));
            });
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Form(
            key: _changePasswordFormKey,
            autovalidateMode: AutovalidateMode.always,
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
                  child: InputTextBox(
                    inputTextLabelValue: 'Password',
                    validator: passwordValidator,
                    onChanged: onChangePassword,
                    obscureTextEnabled: true,
                  ),
                ),
                //* Confirm Password TextBox
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: InputTextBox(
                    inputTextLabelValue: 'Confirm Password',
                    validator: confirmPasswordValidator,
                    onChanged: onChangeConfirmPassword,
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
      ),
    );
  }
}
