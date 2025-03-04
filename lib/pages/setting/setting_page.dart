import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/components/dialog/confirmation_dialog.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Pages
import 'package:flutter_cs_locker_project/pages/app_layout.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late Future<bool> _signInStatusFuture;

  @override
  void initState() {
    super.initState();
    _signInStatusFuture = checkSignInStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> checkSignInStatus() async {
    return await Storage().getData('AUTH_TOKEN') != null;
  }

  void onSignOut() {
    showConfirmationDialog(
      context: context,
      title: 'ออกจากระบบ',
      content: 'คุณต้องการออกจากระบบหรือไม่?',
      onConfirm: () {
        Storage().remove('AUTH_TOKEN');
        Storage().remove('AUTH_USER');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _signInStatusFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          bool isSignIn = snapshot.data ?? false;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                children: [
                  isSignIn
                      ? const Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text('ชื่อ นามสกุล'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('E-mail'),
                              ],
                            ),
                          ),
                        )
                      : const Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text('กรุณาเข้าสู่ระบบ'),
                            subtitle: Text('Please sign in'),
                          ),
                        ),
                  isSignIn
                      ? ListView(
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: 10),
                            Card(
                              child: ListTile(
                                leading: const Icon(Icons.lock),
                                title: const Text('เปลี่ยนรหัสผ่าน'),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {},
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const Icon(Icons.logout),
                                title: const Text('ออกจากระบบ'),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () => onSignOut(),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        )
                      : const SizedBox(height: 10),
                  const Center(
                    child: Column(
                      children: [
                        Text('LockLock | Version: 1.0.0'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
