import 'package:flutter/material.dart';
import 'package:mykuri/app_config/app_config.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/get_started_screen/view/get_started_screen.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';
import 'package:mykuri/presentation/otp_screen/view/otp_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorConstant.mykuriWhite,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetStartedScreen(),
                  ));
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorConstant.mykuriTextColor,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Registration',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorConstant.mykuriPrimaryBlue,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'Register ${AppConfig.appName} account with your referral code',
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: 30),
              RefactoredTextField(
                name: 'Full Name',
              ),
              RefactoredTextField(name: 'Phone number'),
              RefactoredTextField(name: 'Email'),
              RefactoredTextField(
                name: 'Referral code',
                iseye: true,
              ),
              RefactoredTextField(
                name: 'Password',
                iseye: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorConstant.mykuriPrimaryBlue,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: ColorConstant.mykuriWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you already have a account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Login in here"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
