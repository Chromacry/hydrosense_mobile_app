import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/dropdown_textbox.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/input_textbox.dart';

class SharedWidgets {
  static Widget inputTextBox({textLabel, allColorAttributes, onChanged, obscureTextEnabled}) {
    return InputTextBox(inputTextLabelValue: textLabel, allColorAttributes: allColorAttributes,  onChanged: onChanged, obscureTextEnabled: obscureTextEnabled ?? false,);
  }
  static Widget dropdownTextBox({hintText, required List<String> options}) =>
      DropdownTextBox(
        hintText: hintText,
        options: options,
      );
}
