import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Layout/layout.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'package:hydrosense_mobile_app/src/types/user_auth_type.dart';
import './src/constants/DesignContants.dart';

void main() {
  runApp(const App());
  // ignore: prefer_const_constructors
  UserAuthType user = UserAuthType(
    userName: 'John',
    email: 'john@example.com',
    contactNumber: '1234567890',
    lastLogin: '2022-05-02T15:23:56.000Z',
    createdAt: '2022-05-01T10:11:12.000Z',
    updatedAt: '2022-05-03T08:09:10.000Z',
    deletedAt: '2022-05-03T08:09:10.000Z',
    createdBy: 'system',
    updatedBy: 'system',
    deletedBy: 'system',
  );
  debugPrint('abc: $user');
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: DesignConstants.debugBanner,
      title: 'Flutter App Template',
      initialRoute: Login.routeName,
      routes: {
        Login.routeName: (context) => Login(context: context),
        Layout.routeName: (context) => Layout(context: context),
      },
    );
  }
}
