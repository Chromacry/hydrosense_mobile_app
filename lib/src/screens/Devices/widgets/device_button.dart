import 'package:flutter/material.dart';

class DeviceButton extends StatelessWidget {
  final String deviceNameText;
  final String deviceLocationText;
  final Function() onTap;
  final IconData? icon;
  final Color? backgroundColorIcon;
  const DeviceButton({
    Key? key,
    required this.deviceNameText,
    required this.deviceLocationText,
    required this.onTap,
    this.icon,
    this.backgroundColorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            //* Image button
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: backgroundColorIcon ?? Colors.grey,
                  // border: Border.all(
                  //   width: 1,
                  //   color: Colors.grey,
                  // ),
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset(
                'assets/images/water-meter.png',
                height: 30,
                width: 30,
              ),
            ),
            Container(
              width: 200, //30 //200
              child: Column(
                children: [
                  Text(
                    deviceNameText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    deviceLocationText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
