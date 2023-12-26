import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/registration_screen/view/registration_screen.dart';
import 'package:mykuri/presentation/verify_otp_screen/view/verify_otp.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              Text('Forgot password?',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorConstant.mykuriPrimaryBlue,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                  "Please enter the CODE sent to your phone number in the boxes below."),
              SizedBox(height: 30),
              RefactoredTextField(name: 'Phone number'),
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
                    builder: (context) => VerifyotpScreen(),
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
                    "recover password".toUpperCase(),
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
