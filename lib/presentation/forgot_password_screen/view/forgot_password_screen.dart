import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/forgot_password_screen/controller/forgot_password_screen_controller.dart';
import 'package:mykuri/presentation/verify_forgot_pass_otp_screen/view/verify_forgot_pass_otp_screen.dart';
import 'package:mykuri/presentation/verify_otp_screen/view/verify_otp.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final phKey = GlobalKey<FormState>();
  TextEditingController phController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordScreenState = Provider.of<ForgotPasswordScreenController>(context);
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
              Text('Forgot password?',
                  style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Please enter the CODE sent to your phone number in the boxes below."),
              SizedBox(height: 30),
              RefactoredTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[0-9+#*]+$'),
                  ),
                ],
                fromKey: phKey,
                name: 'Phone number',
                controller: phController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  // Define a regex pattern for a valid phone number
                  final phoneRegex = RegExp(r'^[0-9]+$');

                  if (phController.text.isEmpty) {
                    return 'Phone number cannot be empty';
                  } else if (!phoneRegex.hasMatch(phController.text.trim())) {
                    return 'Enter a valid 10-digit phone number';
                  }

                  // Return null if the input is valid
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: forgotPasswordScreenState.isLoading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReusableLoadingWidget(),
                ],
              )
            : GestureDetector(
                onTap: () async {
                  // Check if the form is valid before proceeding
                  if (phKey.currentState!.validate()) {
                    // The form is valid, continue with your logic
                    await Provider.of<ForgotPasswordScreenController>(context, listen: false)
                        .sendOtp(userName: phController.text.trim())
                        .then((value) {
                      if (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifForgotPassOtpScreen(userPhoneNumber: phController.text.trim()),
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
                      "recover password".toUpperCase(),
                      style: TextStyle(color: ColorConstant.mykuriWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
