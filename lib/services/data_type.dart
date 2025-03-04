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

class RegisterUserData {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  RegisterUserData({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });
}

class UserData {
  final String email;
  final String firstname;
  final String lastname;

  UserData({
    required this.email,
    required this.firstname,
    required this.lastname,
  });
}
