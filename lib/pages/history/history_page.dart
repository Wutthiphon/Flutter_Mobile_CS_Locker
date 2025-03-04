import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Components
import 'package:flutter_cs_locker_project/components/locker_card_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isSignIn = false;

  @override
  void initState() {
    super.initState();
    checkSignInStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkSignInStatus() async {
    bool signInStatus = await Storage().getData('AUTH_TOKEN') != null;
    setState(() {
      isSignIn = signInStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          child: isSignIn
              ? Column(
                  children: [
                    // LockerCard(),
                  ],
                )
              : const Center(
                  child: Text('กรุณาเข้าสู่ระบบ'),
                ),
        ),
      ),
    );
  }
}
