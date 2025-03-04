import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/locker_card_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                  left: 20.0,
                  right: 20.0,
                ),
                child: isSignIn
                    ? Column(
                        children: [
                          Text('Is Login')
                          // LockerCard(),
                        ],
                      )
                    : const Center(
                        child: Text('กรุณาเข้าสู่ระบบ'),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
