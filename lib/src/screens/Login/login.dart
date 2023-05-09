import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/DesignContants.dart';
import 'package:flutter_app/src/screens/Login/view/login_view.dart';

class Login extends StatelessWidget {
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
