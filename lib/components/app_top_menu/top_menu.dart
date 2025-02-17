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
      title: Text(title == 'Home' ? 'LockLock' : title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
