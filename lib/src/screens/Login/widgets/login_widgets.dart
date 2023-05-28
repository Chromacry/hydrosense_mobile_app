import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/widgets/line_with_text.dart';

class LoginWidgets {
  static Widget lineWithText(
      {text, fontSize, lineColor, textColor, thickness}) {
    return LineWithText(
      text: text,
      fontSize: fontSize.toDouble(),
      lineColor: lineColor,
      textColor: textColor,
      thickness: thickness.toDouble(),
    );
  }
}
