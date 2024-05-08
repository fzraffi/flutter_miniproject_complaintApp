import 'package:flutter/material.dart';
import 'package:k_app/models/user_model.dart';

class AuthProvider extends ChangeNotifier{
  User? _currentUser;
  User? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    if (email == 'admin@gmail.com' && password == 'admin') {
      _currentUser = User(email: email, password: password);
      notifyListeners();
      return true;
    }
    return false;
  }

}