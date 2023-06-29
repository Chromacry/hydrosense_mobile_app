import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String inputTextLabelValue;
  final String? inputTextValue;
  final Color? allColorAttributes;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool obscureTextEnabled;

  const InputTextBox({
    Key? key,
    required this.inputTextLabelValue,
    this.inputTextValue,
    this.allColorAttributes,
    required this.onChanged,
    required this.validator,
    required this.obscureTextEnabled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: allColorAttributes ?? Colors.white,
      autocorrect: true,
      obscureText: obscureTextEnabled,
      initialValue: inputTextValue,
      decoration: InputDecoration(
        labelText: inputTextLabelValue,
        focusColor: allColorAttributes ?? Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: allColorAttributes ?? Colors.white),
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
        labelStyle: TextStyle(
          color: allColorAttributes ?? Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: allColorAttributes ?? Colors.white,
          ),
        ),
      ),
      style: TextStyle(
        color: allColorAttributes ?? Colors.white,
      ),
      onChanged: onChanged,
    );
  }
}
