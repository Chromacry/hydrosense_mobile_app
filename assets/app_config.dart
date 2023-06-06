import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class AppConfig {
  static ThemeData themeConfig = ThemeData(
    fontFamily: 'Roboto',
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.white,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch:
          const Color(DesignConstants.COLOR_DARKBLUE_PRIMARY) as MaterialColor,
      accentColor: Colors.white,
    ).copyWith(
      secondary: Colors.black,
    ),
  );
}
