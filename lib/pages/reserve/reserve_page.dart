import 'package:flutter/material.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReserveStatePage();
}

class _ReserveStatePage extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Reserve Page'),
      ),
    );
  }
}
