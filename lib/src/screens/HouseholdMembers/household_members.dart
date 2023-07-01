import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/view/household_members_view.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/household_members_widgets.dart';

class HouseholdMembers extends StatelessWidget {
  static String routeName = '/DeviceLocations';
  const HouseholdMembers({
    super.key,
  });
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 1,
            ),
            Text('Household Members'),
            //* Add new Household member
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    HouseholdMembersWidgets.addHouseholdMemberModal(),
              ),
              icon: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        )),
        backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: HouseholdMembersView(),
    );
  }
}
