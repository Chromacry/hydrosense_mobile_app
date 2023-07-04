import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';

class AlertItem extends StatelessWidget {
  final String title;
  final String message;
  final String createdTime;
  final Color? containerItemColor;
  final void Function(DismissDirection) onTap;
  const AlertItem({
    Key? key,
    required this.title,
    required this.message,
    required this.createdTime,
    required this.containerItemColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('idk'),
      onDismissed: onTap,
      direction: DismissDirection.startToEnd,
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
                  // CircleAvatar(
                  //   radius: 20,
                  //   backgroundColor: Colors.black,
                  //   child: Icon(
                  //     Icons.location_pin,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  //* Profile Image
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/da/10/86/da108670e521c5486ea9f5679b2c64fb--diana-korkunova-on-instagram.jpg',
                    ), // RandomAvatar('saytoonz')
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
                          title,
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
                          message,
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
            Align(
              alignment: Alignment.topRight,
              child: Text(
                DateTimeUtil.convertToHumanReadableDate(createdTime),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
