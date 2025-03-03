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
        activeIndex == 0 ? 'Lock!Lock!' : title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: activeIndex == 0
          ? Image.asset(
              './assets/background/page-top-left.png',
              fit: BoxFit.cover,
            )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 110, 132, 145),
                    Color.fromARGB(255, 59, 86, 102),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
      actions: [
        !isSignIn
            ? IconButton.outlined(
                icon: const Icon(Icons.login),
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                      activeIndex == 0 ? Colors.blueGrey : Colors.white),
                ),
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
  Size get preferredSize {
    // เพิ่มความสูงให้กับ AppBar เมื่อ activeIndex == 0
    if (activeIndex == 0) {
      return Size.fromHeight(appBar.preferredSize.height + 30);
    } else {
      return appBar.preferredSize;
    }
  }
}
