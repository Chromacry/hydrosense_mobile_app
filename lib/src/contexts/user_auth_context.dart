import 'package:flutter/material.dart';

class UserAuthContext extends ChangeNotifier {
  bool isAuthenticated = false;
  List<Map> userInfo = [];

  bool isAuth() {
    return isAuthenticated;
  }

  List<Map> getUserInfo() => userInfo;

  void updateUserInfo() {
    notifyListeners();
  }
  
  void handlelogout() {
    isAuthenticated = false;
    notifyListeners();
  }
  
}
