import 'package:openitem_flutter/models/user.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    phone: '',
    type: '',
    token: '',
  );
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
