import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/dropdown_textbox.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/input_textbox.dart';

class SharedWidgets {
  static Widget inputTextBox({
    required textLabel,
    inputTextValue,
    allColorAttributes,
    onChanged,
    validator,
    obscureTextEnabled,
  }) {
    return InputTextBox(
      inputTextLabelValue: textLabel,
      inputTextValue: inputTextValue,
      allColorAttributes: allColorAttributes,
      onChanged: onChanged,
      validator: validator,
      obscureTextEnabled: obscureTextEnabled ?? false,
    );
  }

  static Widget dropdownTextBox({
    required hintText,
    required List<List<String>> options,
    selectedValue,
    required onChanged,
  }) =>
      DropdownTextBox(
        hintText: hintText,
        options: options,
        selectedValue: selectedValue,
        onChanged: onChanged,
      );
}
