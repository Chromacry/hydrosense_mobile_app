import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/DesignContants.dart';

class LoginStyles {
  //* Logo
  static const EdgeInsets logoMargin = EdgeInsets.only(bottom: 10);
  static const double logoWidth = 200;
  static const double logoHeight = 150;

  //* Login Text
  static const Alignment titleAlign = Alignment.centerLeft;
  static const EdgeInsets titleContainerMargin = EdgeInsets.only(bottom: 10);
  static const title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  //* Submit Button
  static const Size buttonSize = Size(350, 50);
  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: Colors.black,
  );
  static const Color iconColor = Colors.black;
  static const int buttonColor = DesignConstants.COLOR_LIGHTBLUE_ACCENT;
}
