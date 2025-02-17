import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final int activeIndex;
  final String title;

  const TopMenu({
    super.key,
    required this.appBar,
    required this.activeIndex,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        activeIndex == 0 ? 'LockLock' : title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 150, 171, 191),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
