import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/DesignContants.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/view/login_view.dart';

class Login extends StatelessWidget {
  static String routeName = '/Login';
  const Login({
    super.key,
    required this.context,
  });

  final BuildContext context;
  @override
  Widget build(context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Login')),
      //   backgroundColor: Colors.black87,
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LoginView(),
    );
  }
}
