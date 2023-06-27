import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:provider/provider.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'src/constants/design_constants.dart';

void main() {
  runApp(const App());
  // ignore: prefer_const_constructors
  // UserAuthType user = UserAuthType(
  //   userName: 'John',
  //   email: 'john@example.com',
  //   contactNumber: '1234567890',
  //   lastLogin: '2022-05-02T15:23:56.000Z',
  //   createdAt: '2022-05-01T10:11:12.000Z',
  //   updatedAt: '2022-05-03T08:09:10.000Z',
  //   deletedAt: '2022-05-03T08:09:10.000Z',
  //   createdBy: 'system',
  //   updatedBy: 'system',
  //   deletedBy: 'system',
  // );
}

class App extends StatelessWidget {
  const App({Key? key});
  @override
  Widget build(BuildContext context) {
    //* Initialized data using provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersDB>(
          create: (context) => UsersDB(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: DesignConstants.debugBanner,
        title: 'Flutter App Template',
        home: Login(),
      ),
    );
  }
}
