import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/providers/waterlogs_db.dart';
import 'package:provider/provider.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'src/constants/design_constants.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key});
  @override
  Widget build(BuildContext context) {
    //* Force app to be potriait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //* Initialized data using provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersDB>(
          create: (context) => UsersDB(),
        ),
        ChangeNotifierProvider<DevicesDB>(
          create: (context) => DevicesDB(),
        ),
        ChangeNotifierProvider<DeviceLocationsDB>(
          create: (context) => DeviceLocationsDB(),
        ),
        ChangeNotifierProvider<WaterLogsDB>(
          create: (context) => WaterLogsDB(),
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
