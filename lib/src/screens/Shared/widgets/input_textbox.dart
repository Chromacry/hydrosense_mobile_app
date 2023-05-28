import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String inputTextLabelValue;
  final Function(String) onChanged;
  final bool obscureTextEnabled;
  
  const InputTextBox({
    Key? key,
    required this.inputTextLabelValue,
    required this.onChanged,
    required this.obscureTextEnabled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      autocorrect: true,
      obscureText: obscureTextEnabled,
      decoration: InputDecoration(
        labelText: inputTextLabelValue,
        focusColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(11),
        //   ),
        //   borderSide: BorderSide(
        //     width: 5,
        //     color: Colors.white,
        //   ),
        // ),
        // //*TextField boder
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   borderSide: BorderSide(
        //     color: Colors.white,
        //   ),
        // ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: onChanged,
    );
  }
}
