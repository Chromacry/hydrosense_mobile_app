import 'package:flutter/material.dart';

import '../../Shared/widgets/input_textbox.dart';

class SharedWidgets {
  static Widget inputTextBox({textLabel, onChanged, obscureTextEnabled}) {
    return InputTextBox(inputTextLabelValue: textLabel, onChanged: onChanged, obscureTextEnabled: obscureTextEnabled ?? false,);
  }
}
