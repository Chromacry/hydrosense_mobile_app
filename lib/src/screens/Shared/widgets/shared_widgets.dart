import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/dropdown_textbox.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/input_textbox.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/status_snackbar.dart';

class SharedWidgets {
  static Widget inputTextBox({
    required textLabel,
    inputTextValue,
    allColorAttributes,
    onChanged,
    autocorrect,
    validator,
    obscureTextEnabled,
    enabled,
  }) {
    return InputTextBox(
      inputTextLabelValue: textLabel,
      inputTextValue: inputTextValue,
      allColorAttributes: allColorAttributes,
      onChanged: onChanged,
      autocorrect: autocorrect,
      validator: validator,
      obscureTextEnabled: obscureTextEnabled,
      enabled: enabled,
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

  static SnackBar statusSnackbar({textMessage}) =>
      StatusSnackbar.snackbarStatus(textMessage: textMessage);
}
