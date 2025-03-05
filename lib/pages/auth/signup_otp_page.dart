import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_cs_locker_project/services/api/auth_api.dart';
import 'package:flutter_cs_locker_project/services/storage/storage.dart';

// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';
import 'package:flutter_cs_locker_project/components/dialog/loading_dialog.dart';

// Pages
import 'package:flutter_cs_locker_project/pages/auth/signup_success_page.dart';

class SignUpOTPPage extends StatefulWidget {
  const SignUpOTPPage({super.key});

  @override
  State<SignUpOTPPage> createState() => _SignUpOTPPageState();
}

class _SignUpOTPPageState extends State<SignUpOTPPage> {
  HttpAuthAPIService httpAuthAPIService = HttpAuthAPIService();

  String otpCode = '';
  bool isApiLoading = false;
  bool isError = false;
  String errorMessage = '';

  void onNextStep() {
    setState(() {
      isError = false;
      errorMessage = '';
    });

    if (!isApiLoading) {
      if (otpCode == '' || otpCode.length != 6) {
        setState(() {
          isError = true;
          errorMessage = 'กรุณากรอกรหัส OTP ให้ครบ 6 หลัก';
        });
        return;
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpSuccessPage(),
        ),
        (route) => false,
      );

      // showLoadingDialog(context);
      // isApiLoading = true;

      // httpAuthAPIService
      //     .register(
      //   RegisterUserData(
      //     firstname: signupUserData.firstname.text,
      //     lastname: signupUserData.lastname.text,
      //     email: signupUserData.email.text,
      //     password: signupUserData.password.text,
      //   ),
      // )
      //     .then(
      //   (res) {
      //     isApiLoading = false;
      //     hideLoadingDialog(context);
      //     if (res.containsKey('error') && !!res['error']) {
      //       setState(() {
      //         isError = true;
      //         errorMessage = res['message'];
      //       });
      //       return;
      //     }
      //     // Navigator.pushReplacement(
      //     //   context,
      //     //   MaterialPageRoute(
      //     //     builder: (context) => const SignUpSuccessPage(),
      //     //   ),
      //     // );
      //     // Storage().saveData('AUTH_TOKEN', res['token']);
      //     // Storage().saveJsonData(
      //     //   'AUTH_USER',
      //     //   {
      //     //     'email': res['email'],
      //     //     'firstname': res['firstname'],
      //     //     'lastname': res['lastname'],
      //     //   },
      //     // );
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              './assets/background/page-top-right.png',
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 180.0,
              left: 10.0,
              right: 10.0,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  './assets/icon/otp.png',
                  width: 250,
                ),
                const SizedBox(height: 10),
                const Text(
                  'ยืนยัน OTP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ระบบทำการส่ง OTP ไปยังอีเมลของคุณแล้ว\nกรุณากรอกรหัส OTP ที่ได้รับ',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  numberOfFields: 6,
                  focusedBorderColor: const Color.fromARGB(255, 10, 81, 147),
                  showFieldAsBox: true,
                  showCursor: true,
                  onSubmit: (String verificationCode) =>
                      otpCode = verificationCode,
                ),
                const SizedBox(height: 10),
                isError
                    ? Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(height: 50),
                CustomElevatedButton(
                  label: 'ดำเนินการต่อ',
                  fullWidth: true,
                  rounded: true,
                  color: 'primary',
                  onPressed: onNextStep,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
