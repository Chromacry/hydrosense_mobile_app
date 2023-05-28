import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/forget_password.dart';
import 'package:hydrosense_mobile_app/src/screens/Layout/layout.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/view/login_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/widgets/login_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersDB usersDBList = Provider.of<UsersDB>(context);
    String emailaddress = '';

    void loginHandler() {
      Navigator.pushNamed(context, Layout.routeName);
      //! Change the below method to check if the user exists instead
      usersDBList.addUser('defaultUsername', emailaddress, '12345678');
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
              child: SharedWidgets.inputTextBox(
                  textLabel: 'Email Address',
                  onChanged: (text) {
                    debugPrint(text);
                    emailaddress = text;
                  }),
            ),
            //* Password TextBox
            Container(
              child: SharedWidgets.inputTextBox(
                textLabel: 'Password',
                onChanged: (text) => debugPrint(text),
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
                onPressed: () => Navigator.pushNamed(context, ForgetPassword.routeName),
              ),
            ),
            //* Submit Button
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: ElevatedButton.icon(
                  onPressed: loginHandler,
                  style: const ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStatePropertyAll(Color(LoginStyles.buttonColor)),
                    fixedSize: MaterialStatePropertyAll(LoginStyles.buttonSize),
                    textStyle: MaterialStatePropertyAll(LoginStyles.buttonText),
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
            LoginWidgets.lineWithText(
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
    );
  }
}
