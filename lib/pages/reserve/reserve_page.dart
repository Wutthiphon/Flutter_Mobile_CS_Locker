import 'package:flutter/material.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReserveStatePage();
}

class _ReserveStatePage extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: const Center(
            child: Text('Reserve Page'),
          ),
        ),
      ),
    );
  }
}
