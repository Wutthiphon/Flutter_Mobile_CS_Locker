import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/components/app_top_menu/top_menu.dart';
import 'package:flutter_cs_locker_project/components/app_bottom_menu/bottom_menu.dart';
// Pages
import 'package:flutter_cs_locker_project/pages/home/home_page.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  // var appMenu = [
  //   {
  //     icon: Icons.home,
  //     data: HomePage(),
  //     label: 'Home',
  //   },
  //   {
  //     icon: Icons.business,
  //     data: HomePage(),
  //     label: 'Business',
  //   },
  //   {
  //     icon: Icons.school,
  //     data: HomePage(),
  //     label: 'School',
  //   },
  // ];
  // activeMenu = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenu(
        appBar: AppBar(),
      ),
      body: const Text('Hello World!'),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
