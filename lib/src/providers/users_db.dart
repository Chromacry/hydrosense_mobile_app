import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydrosense_mobile_app/src/services/firebase_auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();
final CollectionReference<Map<String, dynamic>> firestoreDB =
    FirebaseFirestore.instance.collection('users');

AuthService authService = AuthService();

class UsersDB with ChangeNotifier {
  List<User> users = [
    User(
      id: uuid.v4(),
      username: 'Samantha Chew',
      email_address: 'samantha.chew@gmail.com',
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
  ];

  Stream<List<User>> getAllUsers() {
    return firestoreDB.snapshots().map((snapshot) => snapshot.docs
        .map<User>((doc) => User.fromMap(doc.data(), doc.id))
        .toList());
  }

  Stream<List<User>> getAllUsersByHouseholdId({householdId}) {
    Stream<List<User>> allUsersStream = getAllUsers();

    Stream<List<User>> filteredUsersStream = allUsersStream.map(
      (allUsers) {
        List<User> filteredUsers = allUsers
            .where((currentUser) =>
                currentUser.household_id == householdId &&
                currentUser.deleted_at == null)
            .toList();

        //* Sort the filtered list of users
        filteredUsers.sort((a, b) {
          if (a.role_id == "Household Admin") {
            return -1;
          } else {
            return a.username
                .toString()
                .toUpperCase()
                .compareTo(b.username.toString().toUpperCase());
          }
        });

        return filteredUsers;
      },
    );

    return filteredUsersStream;
  }

  Future<DocumentReference<Map<String, dynamic>>> addUser({
    userName,
    passWord,
    emailAddress,
    phoneNo,
    profilePhoto,
    roleId,
    householdId,
    createdBy,
  }) async {
    //* Register in firebase auth email password auth
    final newUser =
        await AuthService().register(email: emailAddress, password: passWord);
    //* add in personal db data
    User usersData = User(
      id: newUser.user?.uid ?? uuid.v4(),
      username: userName,
      email_address: emailAddress,
      phone_number: phoneNo,
      profile_photo: profilePhoto,
      role_id: roleId,
      household_id: householdId ?? uuid.v4(),
      created_at: DateTimeUtil.getCurrentDateTime(),
      created_by: createdBy,
    );
    return firestoreDB.add({
      'id': usersData.id,
      'username': usersData.username,
      'email_address': usersData.email_address,
      'phone_number': usersData.phone_number,
      'profile_photo': usersData.profile_photo,
      'profile_banner': usersData.profile_banner,
      'role_id': usersData.role_id,
      'household_id': usersData.household_id,
      'user_status': usersData.user_status,
      'last_login': usersData.last_login,
      'created_at': usersData.created_at,
      'created_by': usersData.created_by,
    });
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

  Stream<User?> getCurrentUser() {
    String? currentUserId = authService.getCurrentUserId();
    Stream<List<User>> allUsersStream = getAllUsers();

    Stream<User?> filteredUsersStream = allUsersStream.asyncMap((allUsers) {
      User? filteredUser =
          allUsers.firstWhere((currentUser) => currentUser.id == currentUserId);
      return filteredUser;
    });
    return filteredUsersStream;
  }
}
