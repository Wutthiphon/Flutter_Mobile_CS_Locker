import 'package:flutter/material.dart';

class AppMenuItem {
  final IconData icon;
  final String label;
  final Widget page;

  AppMenuItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}
