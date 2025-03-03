import 'package:flutter/material.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/custom_text_form_filed.dart';
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';

// Pages
import 'package:flutter_cs_locker_project/pages/auth/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signinUserData = UserData(
    username: TextEditingController(),
    password: TextEditingController(),
  );
  bool isApiLoading = false;
  bool isError = false;
  String errorMessage = '';

  void onSignIn() {
    setState(() {
      isError = false;
      errorMessage = '';
    });

    if (signinUserData.username.text.isEmpty ||
        signinUserData.password.text.isEmpty) {
      setState(() {
        isError = true;
        errorMessage = 'กรุณากรอกข้อมูลให้ครบถ้วน';
      });
      return;
    }

    isApiLoading = true;
    // Call API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('เข้าสู่ระบบ'),
              centerTitle: true,
              background: Image.asset(
                './assets/background/page-top-right.png',
                fit: BoxFit.cover,
              ),
            ),
            floating: false,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/logo/logo.png',
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: 50),
                      CustomTextFormField(
                        controller: signinUserData.username,
                        inputLabel: 'E-mail',
                        inputHint: 'E-mail',
                        inputIcon: Icons.person,
                      ),
                      CustomTextFormField(
                        controller: signinUserData.password,
                        inputLabel: 'รหัสผ่าน',
                        inputHint: 'Password',
                        inputIcon: Icons.key,
                        obscureText: true,
                      ),
                      isError
                          ? Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 30),
                      CustomElevatedButton(
                        label: 'เข้าสู่ระบบ',
                        fullWidth: true,
                        rounded: true,
                        color: 'primary',
                        onPressed: onSignIn,
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'หรือ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomElevatedButton(
                        label: 'สมัครสมาชิก',
                        fullWidth: true,
                        rounded: true,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class UserData {
  final TextEditingController username;
  final TextEditingController password;

  UserData({
    required this.username,
    required this.password,
  });
}
