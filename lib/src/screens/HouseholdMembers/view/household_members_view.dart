import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device_location.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_style.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/household_members_widgets.dart';
import 'package:provider/provider.dart';

class HouseholdMembersView extends StatefulWidget {
  const HouseholdMembersView({super.key});

  @override
  State<HouseholdMembersView> createState() => _HouseholdMembersViewState();
}

class _HouseholdMembersViewState extends State<HouseholdMembersView> {
  bool isDeleteModeOn = false;
  @override
  Widget build(BuildContext context) {
    UsersDB usersDB = Provider.of<UsersDB>(context);

    List<User> usersList = usersDB.getAllUsersByHouseholdId(
        householdId: GlobalConstants.temp_householdID);
    //* Listen on provider
    usersDB.addListener(() {
      //* Reload the page when the provider is notified
      setState(() {});
    });
    //* Toggle delete mode
    void onPressedDeleteMode() {
      if (!isDeleteModeOn)
        isDeleteModeOn = true;
      else
        isDeleteModeOn = false;
      setState(() {});
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Sub title
                  Container(
                    padding: DevicesStyles.titleContainerPadding,
                    margin: DevicesStyles.titleContainerMargin,
                    alignment: DevicesStyles.titleAlign,
                    child: const Text(
                      'Manage Members',
                      textAlign: TextAlign.left,
                      style: DevicesStyles.subTitle,
                    ),
                  ),
                  //* Add location button
                  IconButton(
                    onPressed: onPressedDeleteMode,
                    icon: isDeleteModeOn
                        ? Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.red[200],
                            size: 35,
                          )
                        : Icon(
                            Icons.delete_rounded,
                            color: Colors.red[200],
                            size: 35,
                          ),
                  ),
                ],
              ),
              //* Alert
              isDeleteModeOn
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.maxFinite,
                      child: Card(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Delete Mode enabled!',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              //* Devices Box
              Container(
                height: 550, // 214,
                // padding: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DevicesStyles.devicesBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),

                    itemBuilder: (context, index) {
                      User currentUser = usersList[index];
                      String userId = currentUser.id.toString();
                      String roleId = currentUser.role_id.toString();
                      String householdId = GlobalConstants.temp_householdID;
                      String username = currentUser.username.toString();
                      String emailAddress =
                          currentUser.email_address.toString();
                      String phoneNumber = currentUser.phone_number.toString();
                      String userCreatedAt = currentUser.created_at.toString();

                      return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: HouseholdMembersWidgets.householdMemberItem(
                          userName: username,
                          userRole: roleId,
                          householdId: householdId,
                          userCreatedAt: userCreatedAt,
                          containerItemColor:
                              isDeleteModeOn ? Colors.red[200] : Colors.grey,
                          onTap: () {
                            isDeleteModeOn
                                //* Show delete modal
                                ? showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        HouseholdMembersWidgets
                                            .deleteDeviceLocationModal(
                                          userId: userId,
                                          deletedBy: 'Patrica Chew',
                                        ))
                                : //* Show edit modal
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        HouseholdMembersWidgets
                                            .editHouseholdMemberModal(
                                      userId: userId,
                                      userName: username,
                                      emailAddress: emailAddress,
                                      phoneNumber: phoneNumber,
                                      householdId: householdId,
                                      updatedBy: 'Particiaaa Chew',
                                    ),
                                  );
                          },
                        ),
                      );
                    },
                    itemCount: usersList.length,
                    // children: <Widget>[
                    //   DeviceLocationsWidgets.deviceLocationItem(),
                    // ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
