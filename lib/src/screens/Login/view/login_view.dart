import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/forget_password.dart';
import 'package:hydrosense_mobile_app/src/screens/Layout/layout.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/view/login_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/widgets/login_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String emailaddress = '';

    String? emailValidator(value) {
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

    String? passwordValidator(value) {
      if (value == null || value.isEmpty) {
        return 'Password field is empty!';
      }
      return null;
    }

    void loginHandler() {
      if (_loginFormKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
            StatusSnackbar.snackbarStatus(
                textMessage: GlobalConstants
                    .CLIENT_STATUS_MSGS['SUCCESSFUL_LOGIN']
                    .toString()));
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: Layout(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.slideUp,
        );
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              //* Logo
              Container(
                width: LoginStyles.logoWidth,
                height: LoginStyles.logoHeight,
                margin: LoginStyles.logoMargin,
                child: Image.asset('assets/logo/HydroSense_logo_nobg.png'),
              ),
              //* Login Text
              Container(
                margin: LoginStyles.titleContainerMargin,
                alignment: LoginStyles.titleAlign,
                child: const Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: LoginStyles.title,
                ),
              ),
              //* Email Address TextBox
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: InputTextBox(
                  inputTextLabelValue: 'Email Address',
                  onChanged: (text) {
                    debugPrint(text);
                    emailaddress = text;
                  },
                  obscureTextEnabled: false,
                  validator: emailValidator,
                ),
              ),
              //* Password TextBox
              Container(
                child: InputTextBox(
                  inputTextLabelValue: 'Password',
                  onChanged: (text) => debugPrint(text),
                  validator: passwordValidator,
                  obscureTextEnabled: true,
                ),
              ),
              //* Forget Password Button
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: const Text(
                    'forget password?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                  onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ForgetPassword(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  ),
                ),
              ),
              //* Submit Button
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: ElevatedButton.icon(
                    onPressed: loginHandler,
                    style: const ButtonStyle(
                      enableFeedback: true,
                      backgroundColor: MaterialStatePropertyAll(
                          Color(LoginStyles.buttonColor)),
                      fixedSize:
                          MaterialStatePropertyAll(LoginStyles.buttonSize),
                      textStyle:
                          MaterialStatePropertyAll(LoginStyles.buttonText),
                    ),
                    label: const Text('Login', style: LoginStyles.buttonText),
                    icon: const Icon(
                      Icons.login_rounded,
                      color: LoginStyles.iconColor,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              //* Continue With Section
              LineWithText(
                text: 'Continue with',
                thickness: 2,
                fontSize: 18,
                lineColor: Colors.white,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 25,
              ),
              //* Google and Facebook Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/google-icon.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    onTap: () => debugPrint('Redirecting to google auth'),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/facebook-icon.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    onTap: () => debugPrint('redirecting to facebook auth'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
