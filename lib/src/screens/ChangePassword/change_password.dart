import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/ChangePassword/view/change_password_view.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key,});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Change Password',
          ),
        ),
        backgroundColor: const Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: const ChangePasswordView(),
    );
  }
}
