import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class HouseholdMemberItem extends StatelessWidget {
  final String userName;
  final String userRole;
  final String householdId;
  final String householdCreatedAt;
  final Color? containerItemColor;
  final Function() onTap;
  const HouseholdMemberItem({
    Key? key,
    required this.userName,
    required this.userRole,
    required this.householdId,
    required this.householdCreatedAt,
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
                          userName,
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
                          userRole,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          householdCreatedAt,
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
