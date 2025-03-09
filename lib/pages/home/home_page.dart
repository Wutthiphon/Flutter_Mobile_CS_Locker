import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/carousel_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<bool> _signInStatusFuture;
  late UserData userData;

  late Future<List<String>> _imageUrlsFuture;

  @override
  void initState() {
    super.initState();
    _signInStatusFuture = checkSignInStatus();
    _imageUrlsFuture = fetchImageUrls();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> checkSignInStatus() async {
    bool isSignIn = await Storage().getData('AUTH_TOKEN') != null;
    if (isSignIn) {
      Map<String, dynamic>? userDataString =
          (await Storage().getJsonData('AUTH_USER'));
      if (userDataString != null) {
        userData = UserData(
          email: userDataString['email'] ?? '',
          firstname: userDataString['firstname'] ?? '',
          lastname: userDataString['lastname'] ?? '',
        );
      }
    }

    return isSignIn;
  }

  Future<List<String>> fetchImageUrls() async {
    // ...
    return [
      "https://wutthiphon.space/bg1.58469ece57fad897.png",
      "https://wutthiphon.space/bg1.58469ece57fad897.png",
    ];
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
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  isSignIn
                      ? Card(
                          // Gradient Card
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 76, 108, 145),
                                  Color.fromARGB(255, 104, 162, 196)
                                ],
                              ),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.account_circle_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'ยินดีต้อนรับ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${userData.firstname} ${userData.lastname}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Card(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 77, 77, 77),
                                  Color.fromARGB(255, 128, 128, 128)
                                ],
                              ),
                            ),
                            child: const ListTile(
                              leading: Icon(
                                Icons.account_circle_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                              title: Text(
                                'ยินดีต้อนรับผู้เยี่ยมชม',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Guest',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  FutureBuilder<List<String>>(
                    future: _imageUrlsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final imageUrls = snapshot.data ?? [];

                      return SingleChildScrollView(
                        child: CustomImageCarousel(imageUrls: imageUrls),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "แนะนำการใช้งาน",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "ทดสอบการใช้งานแอปพลิเคชัน",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
