import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/services/api/locker_api.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/locker_card_widget.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
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
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: HttpLockerAPIService().getLockersNotInUsed(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                            snapshot.data.containsKey('error') &&
                            snapshot.data['error'])) {
                      return Center(
                        child: Text(
                            'Error: ${snapshot.error ?? (snapshot.data as Map)['message']}'),
                      );
                    }

                    List<Locker> lockers = (snapshot.data as List)
                        .map((e) => Locker.fromJson(e as Map<String, dynamic>))
                        .toList();

                    return Column(
                      children: [
                        for (Locker locker in lockers)
                          LockerCard(
                            lockerData: locker,
                            isLogin: isSignIn,
                          ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
