import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/forgot_password_screen/view/forgot_password.dart';
import 'package:mykuri/presentation/registration_screen/view/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.mykuriWhite,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorConstant.mykuriTextColor,
        ),
      ),
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
              Text('Log in to your account',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorConstant.mykuriPrimaryBlue,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Log into your My Kuri account"),
              SizedBox(height: 60),
              RefactoredTextField(name: 'User name/phone number'),
              RefactoredTextField(name: 'Password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: Text(
                        "Click here",
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorConstant.mykuriPrimaryBlue),
                      ))
                ],
              )
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => OtpScreen(),
                //   ),
                // );
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
                Text("Do you not have a account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text("Register here"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
