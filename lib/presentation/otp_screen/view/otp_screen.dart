import 'package:flutter/material.dart';
import 'package:mykuri/app_config/app_config.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:pinput/pinput.dart';

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
              width: MediaQuery.of(context).size.width * .80,
              child: Row(
                children: [
                  Text(
                      "If the CODE didn't come to your phone we can email to your mail"),
                  TextButton(
                    onPressed: () {},
                    child: Text('Click Here'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
