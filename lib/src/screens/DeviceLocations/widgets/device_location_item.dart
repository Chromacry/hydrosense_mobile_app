import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class DeviceLocationItem extends StatelessWidget {
  final String locationName;
  final String locationHouseholdId;
  final String locationCreatedAt;
  final Color? containerItemColor;
  final Function() onTap;
  const DeviceLocationItem({
    Key? key,
    required this.locationName,
    required this.locationHouseholdId,
    required this.locationCreatedAt,
    required this.containerItemColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11)),
          color: containerItemColor,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Location Icon
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          locationName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          locationCreatedAt,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
