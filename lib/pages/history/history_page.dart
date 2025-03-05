import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/services/api/locker_api.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

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
                child: isSignIn
                    ? Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.key,
                                        color: Colors.blueGrey,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'ล็อคเกอร์ที่กำลังใช้งานอยู่',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  FutureBuilder(
                                    future: HttpLockerAPIService()
                                        .getMyLockerInUsed(),
                                    builder: (context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                              strokeCap: StrokeCap.round,
                                            ),
                                          ),
                                        );
                                      }

                                      if (snapshot.hasError ||
                                          (snapshot.data is Map &&
                                              snapshot.data
                                                  .containsKey('error') &&
                                              snapshot.data['error'])) {
                                        return Center(
                                          child: Text(
                                              'Error: ${snapshot.error ?? (snapshot.data as Map)['message']}'),
                                        );
                                      }

                                      List<Locker> lockers =
                                          (snapshot.data['data'] as List)
                                              .map((e) => Locker.fromJson(
                                                  e as Map<String, dynamic>))
                                              .toList();
                                      return Column(
                                        children: [
                                          lockers.isNotEmpty
                                              ? Column(
                                                  children: lockers
                                                      .map((locker) =>
                                                          LockerCard(
                                                            lockerData: locker,
                                                            isLogin: isSignIn,
                                                          ))
                                                      .toList(),
                                                )
                                              : const Text(
                                                  'ไม่มีล็อคเกอร์ที่กำลังใช้งานอยู่'),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.history,
                                        color: Colors.blueGrey,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'ประวัติการใช้งาน',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  FutureBuilder(
                                    future: HttpLockerAPIService()
                                        .getMyLockerExpired(),
                                    builder: (context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                              strokeCap: StrokeCap.round,
                                            ),
                                          ),
                                        );
                                      }

                                      if (snapshot.hasError ||
                                          (snapshot.data is Map &&
                                              snapshot.data
                                                  .containsKey('error') &&
                                              snapshot.data['error'])) {
                                        return Center(
                                          child: Text(
                                              'Error: ${snapshot.error ?? (snapshot.data as Map)['message']}'),
                                        );
                                      }

                                      List<Locker> lockers =
                                          (snapshot.data['data'] as List)
                                              .map((e) => Locker.fromJson(
                                                  e as Map<String, dynamic>))
                                              .toList();
                                      return Column(
                                        children: [
                                          lockers.isNotEmpty
                                              ? Column(
                                                  children: lockers
                                                      .map((locker) =>
                                                          LockerCard(
                                                            lockerData: locker,
                                                            isLogin: isSignIn,
                                                          ))
                                                      .toList(),
                                                )
                                              : const Text(
                                                  'ยังไม่มีการใช้งานล็อคเกอร์'),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
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
