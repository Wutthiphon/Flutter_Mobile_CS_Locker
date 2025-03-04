import 'package:flutter/material.dart';

class AppMenuItem {
  final Icon icon;
  final String label;
  final Widget page;

  AppMenuItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}

class LoginUserData {
  final String username;
  final String password;

  LoginUserData({
    required this.username,
    required this.password,
  });
}
