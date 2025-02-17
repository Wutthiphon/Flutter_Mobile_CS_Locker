import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/pages/setting/setting_page.dart';
// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

// Navigation Components
import 'package:flutter_cs_locker_project/components/app_top_menu/top_menu.dart';
import 'package:flutter_cs_locker_project/components/app_bottom_menu/bottom_menu.dart';

// Pages
import 'package:flutter_cs_locker_project/pages/home/home_page.dart';

import 'package:flutter_cs_locker_project/pages/setting/setting_page.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int activeIndex = 0;
  final List<AppMenuItem> menuItems = [
    AppMenuItem(
      icon: Icons.home,
      label: 'Home',
      page: const HomePage(),
    ),
    AppMenuItem(
      icon: Icons.settings,
      label: 'Settings',
      page: const SettingPage(),
    ),
  ];

  void onTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenu(
        appBar: AppBar(),
        title: menuItems[activeIndex].label,
      ),
      body: menuItems[activeIndex].page,
      bottomNavigationBar: BottomMenu(
        activeIndex: activeIndex,
        menuItems: menuItems,
        onTab: onTab,
      ),
    );
  }
}
