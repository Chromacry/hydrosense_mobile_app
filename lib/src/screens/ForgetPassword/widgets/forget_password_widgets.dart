import 'package:flutter/material.dart';

import 'input_textbox.dart';

class ForgetPasswordWidgets {
  static Widget inputTextBox({textLabel, onChanged, obscureTextEnabled}) {
    return InputTextBox(inputTextLabelValue: textLabel, onChanged: onChanged, obscureTextEnabled: obscureTextEnabled ?? false,);
  }
}
