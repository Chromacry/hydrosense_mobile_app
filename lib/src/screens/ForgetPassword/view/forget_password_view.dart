import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/view/forget_password_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:hydrosense_mobile_app/src/services/firebase_auth/auth_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    UsersDB usersDBList = Provider.of<UsersDB>(context);
    String emailaddress = '';

    //* validator
    String? emailAddressValidator(value) {
      if (value == null || value.isEmpty) {
        return 'Email field is empty!';
      }
      // Regular expression to match an email address
      final RegExp emailRegex =
          RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$');

      // Check if the value matches the regular expression
      if (!emailRegex.hasMatch(value)) {
        return 'Invalid email address!';
      }
      return null;
    }

    void resetPasswordHandler() async {
      //! Change the below method to check user exist then send email to reset password.
      // usersDBList.updateUserByEmail('defaultUsername', emailaddress, '12345678');
      debugPrint('emailaddress: $emailaddress');
      await authService.forgotPassword(email: emailaddress).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            StatusSnackbar.snackbarStatus(
                textMessage: 'Reset Password email sent!'));
        PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: Login(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.slideRight,
          );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            StatusSnackbar.snackbarStatus(textMessage: error.toString()));
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Form(
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
                //* Login Text
                Container(
                  margin: ForgetPasswordStyles.titleContainerMargin,
                  alignment: ForgetPasswordStyles.titleAlign,
                  child: const Text(
                    'Reset Password',
                    textAlign: TextAlign.left,
                    style: ForgetPasswordStyles.title,
                  ),
                ),
                //* Email Address TextBox
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: InputTextBox(
                      inputTextLabelValue: 'Email Address',
                      validator: emailAddressValidator,
                      onChanged: (text) {
                        debugPrint(text);
                        emailaddress = text;
                      }),
                ),
                //* Submit Button
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: ElevatedButton.icon(
                      onPressed: resetPasswordHandler,
                      style: const ButtonStyle(
                        enableFeedback: true,
                        backgroundColor: MaterialStatePropertyAll(
                            Color(ForgetPasswordStyles.buttonColor)),
                        fixedSize: MaterialStatePropertyAll(
                            ForgetPasswordStyles.buttonSize),
                        textStyle: MaterialStatePropertyAll(
                            ForgetPasswordStyles.buttonText),
                      ),
                      label: const Text('Reset Password',
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
