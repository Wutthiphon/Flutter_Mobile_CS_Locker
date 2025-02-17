import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const TopMenu({
    super.key,
    required this.appBar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title == 'หน้าแรก' ? 'LockLock' : title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
