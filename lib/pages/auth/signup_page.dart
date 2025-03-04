import 'package:flutter/material.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/custom_text_form_filed.dart';
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isKeyboardOpen = false;

  var registerFormKey = GlobalKey<FormState>();
  final signupUserData = UserRegisterData(
    fname: TextEditingController(),
    lname: TextEditingController(),
    email: TextEditingController(),
    password: TextEditingController(),
    repassword: TextEditingController(),
  );
  bool isApiLoading = false;
  bool isError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    signupUserData.fname.dispose();
    signupUserData.lname.dispose();
    signupUserData.email.dispose();
    signupUserData.password.dispose();
    signupUserData.repassword.dispose();
    super.dispose();
  }

  void onSignUp() {
    setState(() {
      isError = false;
      errorMessage = '';
    });

    if (!registerFormKey.currentState!.validate() && !isApiLoading) {
      if (signupUserData.password.text != signupUserData.repassword.text) {
        setState(() {
          isError = true;
          errorMessage = 'รหัสผ่านไม่ตรงกัน';
        });
        return;
      }

      isApiLoading = true;
      // Call API
    }
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            color: isKeyboardOpen
                ? const Color.fromARGB(212, 193, 222, 255)
                : Colors.transparent,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text('สมัครสมาชิก'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/background/page-top-right.png'),
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: registerFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: signupUserData.fname,
                        inputLabel: 'ชื่อ',
                        inputHint: 'Name',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อ';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: signupUserData.lname,
                        inputLabel: 'นามสกุล',
                        inputHint: 'Lastname',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกนามสกุล';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: signupUserData.email,
                        inputLabel: 'E-mail',
                        inputHint: 'E-mail',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onValidate: (value) {
                          if (value?.isEmpty ?? true) return 'กรุณากรอก E-mail';
                          if (!RegExp(r'@').hasMatch(value ?? '')) {
                            return 'กรุณากรอก E-mail ให้ถูกต้อง';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: signupUserData.password,
                        inputLabel: 'รหัสผ่าน',
                        inputHint: 'Password',
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกรหัสผ่าน';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: signupUserData.repassword,
                        inputLabel: 'รหัสผ่านอีกครั้ง',
                        inputHint: 'Re Enter Password',
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกรหัสผ่านอีกครั้ง';
                          }
                          return null;
                        },
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
                      const SizedBox(height: 10),
                      CustomElevatedButton(
                        label: 'สมัครสมาชิก',
                        fullWidth: true,
                        rounded: true,
                        color: 'primary',
                        onPressed: () => onSignUp(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class UserRegisterData {
  final TextEditingController fname;
  final TextEditingController lname;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController repassword;

  UserRegisterData({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.repassword,
  });
}
