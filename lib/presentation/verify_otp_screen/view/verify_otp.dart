import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/reset_password_screen/view/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class VerifyotpScreen extends StatelessWidget {
  const VerifyotpScreen({super.key});

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
              Text('Verify account',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorConstant.mykuriPrimaryBlue,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Please enter your phone number to recover your password."),
              SizedBox(height: 70),
              Center(child: Pinput()),
              SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend OTP?',
                    style: TextStyle(
                        fontSize: 18, color: ColorConstant.mykuriPrimaryBlue),
                  ),
                ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
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
                    "Verify Phone".toUpperCase(),
                    style: TextStyle(
                        color: ColorConstant.mykuriWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
