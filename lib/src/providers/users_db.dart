import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class UsersDB with ChangeNotifier {
  List<User> users = [
    User(
      id: uuid.v4(),
      username: 'Samantha Chew',
      email_address: 'patricia.chew@gmail.com',
      phone_number: '12345678',
      profile_photo: '',
      role_id: 'Household User',
      household_id: GlobalConstants.temp_householdID,
      created_at: '2023-06-26',
      created_by: 'system',
    ),
    User(
      id: uuid.v4(),
      username: 'Patricia Chew',
      email_address: 'patricia.chew@gmail.com',
      phone_number: '12345678',
      profile_photo: '',
      role_id: 'Household Admin',
      household_id: GlobalConstants.temp_householdID,
      created_at: '2023-06-26',
      created_by: 'system',
    ),
    User(
      id: uuid.v4(),
      username: 'John Chew',
      email_address: 'patricia.chew@gmail.com',
      phone_number: '12345678',
      profile_photo: '',
      role_id: 'Household User',
      household_id: GlobalConstants.temp_householdID,
      created_at: '2023-06-26',
      created_by: 'system',
    )
  ];

  List<User> getAllUsers() {
    return users;
  }

  List<User> getAllUsersByHouseholdId({householdId}) {
    List<User> usersList = [];
    for (var currentUser in users) {
      if (currentUser.household_id == householdId &&
          currentUser.deleted_at == null) usersList.add(currentUser);
    }
    //* Sort the userlist
    usersList.sort((a, b) {
    if (a.role_id == "Household Admin") {
      return -1;
    } else if (b.role_id == "Household Admin") {
      return 1;
    } else {
      return a.username.toString().compareTo(b.username.toString());
    }
  });
    return usersList;
  }

  void addUser({
    userName,
    emailAddress,
    phoneNo,
    profilePhoto,
    roleId,
    householdId,
    createdBy,
  }) {
    users.add(User(
      id: uuid.v4(),
      username: userName,
      email_address: emailAddress,
      phone_number: phoneNo,
      profile_photo: profilePhoto,
      role_id: roleId,
      household_id: householdId ?? uuid.v4(),
      created_at: DateTimeUtil.getCurrentDateTime(),
      created_by: createdBy,
    ));
    notifyListeners();
  }

  User? getUserByEmail(emailAddress) {
    User? userData;
    for (var currentUser in users) {
      if (userData?.email_address == emailAddress) userData = currentUser;
    }
    return userData;
  }

  void updateUserInfoById({
    userId,
    userName,
    emailAddress,
    phoneNo,
    updatedBy,
  }) {
    int userIndex = users.indexWhere((element) => element.id == userId);
    if (userIndex != -1) {
      User currentUser = users[userIndex];
      currentUser.username = userName;
      currentUser.phone_number = phoneNo;
      currentUser.email_address = emailAddress;
      currentUser.updated_by = updatedBy;
      currentUser.updated_at = DateTimeUtil.getCurrentDateTime();
      notifyListeners();
    }
  }

  void updateUserPasswordById({
    userId,
    userName,
    password,
    updatedBy,
    updatedAt,
  }) {
    int userIndex = users.indexWhere((element) => element.id == userId);
    if (userIndex != -1) {
      User currentUser = users[userIndex];
      currentUser.password = password;
      currentUser.updated_by = updatedBy;
      currentUser.updated_at = updatedAt;
      notifyListeners();
    }
  }

  void deleteUserById({
    userId,
    deletedBy,
  }) {
    int userIndex = users.indexWhere((element) => element.id == userId);
    if (userIndex != -1) {
      User currentUser = users[userIndex];
      currentUser.deleted_by = deletedBy;
      currentUser.deleted_at = DateTimeUtil.getCurrentDateTime();
      notifyListeners();
    }
  }

  void removeUserById(emailAddress) {
    users.removeAt(
        users.indexWhere((element) => element.email_address == emailAddress));
    notifyListeners();
  }
}
