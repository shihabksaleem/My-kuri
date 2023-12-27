import 'package:flutter/material.dart';

import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/presentation/terms_and_condirtion_screen.dart/view/terms_and_condition_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Text(
              'Please enter the CODE sent to your phone number in the boxes below.',
              style: TextStyle(height: 1.5),
            ),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TermsAndCondtions(),
                ));
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorConstant.mykuriPrimaryBlue,
            ),
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
      ),
    );
  }
}
