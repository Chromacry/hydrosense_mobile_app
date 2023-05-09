import 'package:flutter/material.dart';

class AppConfig {
  static ThemeData themeConfig = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      secondary: Colors.black,
    ),
  );
}
