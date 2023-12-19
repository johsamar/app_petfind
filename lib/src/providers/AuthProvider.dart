import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogged = false;
  bool get isLogged => _isLogged;

  String? _token;
  String? _userId;

  void login() {
    _isLogged = true;
    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
  }

  void setUserId(String id) {
    _userId = id;
  }

  String? get token => _token;
  String? get userId => _userId;

}
