import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text('Setting Page'),
            SizedBox(height: 16),
            Text('LockLock | Version: 1.0.0'),
          ],
        ),
      ),
    );
  }
}
