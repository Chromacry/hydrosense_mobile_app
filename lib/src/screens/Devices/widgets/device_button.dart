import 'package:flutter/material.dart';

class DeviceButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  final IconData icon;
  const DeviceButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          //* Image button
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          Container(
            width: 60,
            child: Column(
              children: [
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Level 2 - Kitchen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}