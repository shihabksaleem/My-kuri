import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/presentation/reset_password_screen/view/reset_password_screen.dart';
import 'package:mykuri/presentation/verify_forgot_pass_otp_screen/controller/verify_forgot_pass_otp_screen_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifForgotPassOtpScreen extends StatefulWidget {
  const VerifForgotPassOtpScreen({super.key, required this.userPhoneNumber});
  final String userPhoneNumber;

  @override
  State<VerifForgotPassOtpScreen> createState() => _VerifForgotPassOtpScreenState();
}

class _VerifForgotPassOtpScreenState extends State<VerifForgotPassOtpScreen> {
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
    final verifyOtpScreenState = Provider.of<VerifyForgotPassOtpScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.mykuriWhite,
        elevation: 0,
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
                  style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Please enter your phone number to recover your password."),
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
                                await Provider.of<VerifyForgotPassOtpScreenController>(context, listen: false)
                                    .resendOtp(userName: widget.userPhoneNumber);
                                _counter = 180; // Reset the counter after clicking Resend
                                startTimer();
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: verifyOtpScreenState.isPostLoading
            ? ReusableLoadingWidget()
            : GestureDetector(
                onTap: () async {
                  // Check if the form is valid before navigating
                  if (otpKey.currentState!.validate()) {
                    await Provider.of<VerifyForgotPassOtpScreenController>(context, listen: false)
                        .verifyOtp(OTP: otpController.text.trim(), userName: widget.userPhoneNumber)
                        .then((value) {
                      if (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(
                                accessToken: verifyOtpScreenState.forgotPassVerificationResModel?.token),
                          ),
                        );
                      } else {
                        // Todo
                      }
                    });
                  }
                },
                child: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(color: ColorConstant.mykuriPrimaryBlue, borderRadius: BorderRadius.circular(8)),
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
