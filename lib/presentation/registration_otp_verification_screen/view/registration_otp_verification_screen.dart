import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:mykuri/presentation/registration_otp_verification_screen/controller/registration_otp_verification_screen_controller.dart';
import 'package:mykuri/presentation/terms_and_condirtion_screen.dart/view/terms_and_condition_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class RegistartionOtpVerificationScreen extends StatefulWidget {
  const RegistartionOtpVerificationScreen({
    super.key,
    required this.phNumber,
  });
  final String phNumber;

  @override
  State<RegistartionOtpVerificationScreen> createState() => _RegistartionOtpVerificationScreenState();
}

class _RegistartionOtpVerificationScreenState extends State<RegistartionOtpVerificationScreen> {
  final otpKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  late Timer _timer;
  int _counter = 180; // 3 minutes in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verifyOtpScreenState = Provider.of<RegistrationOtpVerificationScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.mykuriWhite,
        elevation: 0,
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
                style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Please enter the OTP sent to your phone number in the boxes below.',
              style: TextStyle(height: 1.5),
            ),
            SizedBox(height: 70),
            Center(
              child: Form(
                key: otpKey, // Form key for validation
                child: Pinput(
                  controller: otpController, // Controller for handling input

                  validator: (value) {
                    // Define your validation logic here
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    } else if (value.length != 4) {
                      return 'OTP should be 4 digits long';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: verifyOtpScreenState.isResendLoading
                  ? ReusableLoadingWidget()
                  : TextButton(
                      onPressed: _counter > 0
                          ? null
                          : () async {
                              await Provider.of<RegistrationOtpVerificationScreenController>(context, listen: false)
                                  .resendOtp(userPhoneNumber: widget.phNumber)
                                  .then((value) {
                                if (value) {
                                  otpController.clear();
                                  _counter = 180; // Reset the counter after clicking Resend
                                  startTimer();
                                }
                              });
                            },
                      child: Text(
                        _counter > 0 ? 'Resend OTP in $_counter seconds' : 'Resend OTP',
                        style: TextStyle(fontSize: 18, color: ColorConstant.mykuriPrimaryBlue),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: verifyOtpScreenState.isPostLoading
            ? ReusableLoadingWidget()
            : GestureDetector(
                onTap: () async {
                  if (otpKey.currentState!.validate()) {
                    await Provider.of<RegistrationOtpVerificationScreenController>(context, listen: false)
                        .verifyOtp(
                      otp: otpController.text.trim(),
                      userPhoneNumber: widget.phNumber,
                    )
                        .then((value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavScreen(),
                            ),
                            (route) => false);
                      } else {
                        // Todo
                      }
                    });
                  }
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
                      style: TextStyle(color: ColorConstant.mykuriWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
