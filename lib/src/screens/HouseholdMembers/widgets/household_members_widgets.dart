import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/add_household_member_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/delete_household_member_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/edit_household_member_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/widgets/household_member_item.dart';

class HouseholdMembersWidgets {
  static Widget householdMemberItem({
    required userName,
    required userRole,
    required householdId,
    required userCreatedAt,
    Color? containerItemColor,
    required Function() onTap,
  }) =>
      HouseholdMemberItem(
        userName: userName,
        userRole: userRole,
        householdId: householdId,
        householdCreatedAt: userCreatedAt,
        containerItemColor: containerItemColor,
        onTap: onTap,
      );
  static Widget addHouseholdMemberModal() => AddHouseholdMemberModal();
  static Widget editHouseholdMemberModal({
    required userId,
    required emailAddress,
    required userName,
    required phoneNumber,
    required householdId,
    required updatedBy,
  }) =>
      EditHouseholdMemberModal(
        userId: userId,
        emailAddress: emailAddress,
        userName: userName,
        householdId: householdId,
        phoneNumber: phoneNumber,
      );
  static Widget deleteDeviceLocationModal({
    required userId,
    required deletedBy,
  }) =>
      DeleteHouseholdMemberModal(
        userId: userId,
      );
}
