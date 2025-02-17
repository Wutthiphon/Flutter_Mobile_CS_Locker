import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const TopMenu({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('LockLock'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
