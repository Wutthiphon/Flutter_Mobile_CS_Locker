import 'package:flutter/material.dart';

// Pages
import 'package:flutter_cs_locker_project/pages/auth/signin_page.dart';

class TopMenu extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final int activeIndex;
  final String title;
  final bool isSignIn;

  const TopMenu({
    super.key,
    required this.appBar,
    required this.activeIndex,
    required this.title,
    required this.isSignIn,
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
      actions: [
        !isSignIn
            ? IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
