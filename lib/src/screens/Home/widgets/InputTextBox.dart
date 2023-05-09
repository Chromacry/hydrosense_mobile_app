import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String inputTextLabelValue;

  const InputTextBox({required this.inputTextLabelValue, super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: inputTextLabelValue,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
          borderSide: BorderSide(
            width: 5,
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
