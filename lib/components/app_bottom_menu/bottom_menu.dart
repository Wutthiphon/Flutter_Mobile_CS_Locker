import 'package:flutter/material.dart';
// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

class BottomMenu extends StatelessWidget {
  final int activeIndex;
  final List<AppMenuItem> menuItems;
  final Function(int) onTab;

  const BottomMenu({
    super.key,
    required this.activeIndex,
    required this.menuItems,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      onTap: onTab,
      items: menuItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        );
      }).toList(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
