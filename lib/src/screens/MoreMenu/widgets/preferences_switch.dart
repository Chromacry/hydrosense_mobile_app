import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class PreferencesSwitch extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final Function onToggle;
  const PreferencesSwitch({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.onToggle,
  });

  @override
  State<PreferencesSwitch> createState() => _PreferencesSwitchState();
}

class _PreferencesSwitchState extends State<PreferencesSwitch> {
  bool toggleStatus = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: widget.titleStyle,
        ),
        Switch(
          // This bool value toggles the switch.
          value: toggleStatus,
          activeColor: Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              toggleStatus = value;
            });
            widget.onToggle(value);
          },
        ),
      ],
    );
  }
}
