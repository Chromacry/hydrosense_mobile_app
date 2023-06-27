import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/widgets/more_menu_button.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/widgets/preferences_switch.dart';

class MoreMenuWidgets {
  static Widget moreMenuButton({
    required String buttonText,
    required Function() onTap,
    required IconData icon,
  }) =>
      MoreMenuButton(
        buttonText: buttonText,
        onTap: onTap,
        icon: icon,
      );
  static Widget preferencesSwitch(
          {required String title, required TextStyle titleStyle, required Function onToggle}) =>
      PreferencesSwitch(
        title: title,
        titleStyle: titleStyle,
        onToggle: onToggle,
      );
}
