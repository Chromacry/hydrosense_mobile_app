import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';

class UsersDB with ChangeNotifier {
  List<User> users = [];

  List<User> getAllUsers() {
    return users;
  }

  void addUser(userName, email, phoneNo) {
    users.add(User(userName: userName, email: email, phoneNo: phoneNo));
    notifyListeners();
  }

  User getUserByEmail(email) {
    User userData = User(userName: '', email: '', phoneNo: '');
    for (var currentUser in users) {
      if (userData.userName == email) userData = currentUser;
    }
    return userData;
  }

  void updateUserByEmail(userName, email, phoneNo) {
    users[users.indexWhere((element) => element.email == email)] = User(userName: userName, email: email, phoneNo: phoneNo);
    notifyListeners();
  }

  void removeUserById(email) {
    users.removeAt(users.indexWhere((element) => element.email == email));
    notifyListeners();
  }
}
