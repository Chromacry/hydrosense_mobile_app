import 'package:flutter/material.dart';

import 'input_textbox.dart';

class LoginWidgets {
  static Widget inputTextBox({textLabel, onChanged}) {
    return InputTextBox(inputTextLabelValue: textLabel, onChanged: onChanged);
  }
}
