import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/ForgetPassword/view/forget_password_view.dart';

class ForgetPassword extends StatelessWidget {
  static String routeName = '/ForgetPassword';
  const ForgetPassword({super.key,});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Reset Password',
          ),
        ),
        backgroundColor: const Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: const ForgetPasswordView(),
    );
  }
}
