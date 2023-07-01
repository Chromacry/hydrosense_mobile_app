import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownTextBox extends StatefulWidget {
  final List<String> options;
  final String hintText;

  DropdownTextBox({
    super.key,
    required this.options,
    required this.hintText,
  });

  @override
  State<DropdownTextBox> createState() => _DropdownTextBoxState();
}

class _DropdownTextBoxState extends State<DropdownTextBox> {
  List<String> options = ['All Devices'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    options.addAll(widget.options);
    selectedValue = options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          //* Icon of dropdown box
          iconStyleData: IconStyleData(
            iconEnabledColor: Colors.white,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
          ),
          //* Dropdown box style
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              // color: Colors.grey, //* Background of dropdownbox
              border: Border(
                bottom: BorderSide(
                  color: Colors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
            height: 40,
            width: 140,
          ),
          //* Dropdown Menu Items Styles
          items: options
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          //* Dropdown Menu Style
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(11),
                  bottomRight: Radius.circular(11)),
            ),
          ),
        ),
      ),
    );
  }
}
