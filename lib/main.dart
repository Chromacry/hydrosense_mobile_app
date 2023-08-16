import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrosense_mobile_app/firebase_options.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/providers/waterlogs_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Layout/BottomNavigation/bottom_navigation.dart';
import 'package:hydrosense_mobile_app/src/services/firebase_auth/auth_service.dart';
import 'package:hydrosense_mobile_app/src/services/firebase_auth/google_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'src/constants/design_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    runApp(App());
  });
}

class App extends StatelessWidget {
  const App({Key? key});
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    //* Force app to be potriait mode
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    //* Initialized data using provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleAuthService>(
          create: (context) => GoogleAuthService(),
        ),
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
      child: StreamBuilder<User?>(
          stream: authService.getAuthUser(),
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: DesignConstants.debugBanner,
              title: 'Flutter App Template',
              home: snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : snapshot.hasData
                      ? BottomNavigation()
                      : Login(),
            );
          }),
    );
  }
}
