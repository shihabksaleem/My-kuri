import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for WhitelistingTextInputFormatter
import 'package:get/get.dart';
import 'package:mykuri/app_config/app_config.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/get_started_screen/view/get_started_screen.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';
import 'package:mykuri/presentation/registration_otp_verification_screen/view/registration_otp_verification_screen.dart';
import 'package:mykuri/presentation/registration_screen/controller/registration_screen_controller.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _referralCodeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referrelCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registrationScreenState = Provider.of<RegistrationScreenController>(context);

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
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorConstant.mykuriTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Registration',
                  style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Register ${AppConfig.APP_NAME} account with your referral code',
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(height: 10),
                RefactoredTextField(
                  name: 'Full Name',
                  controller: fullNameController,
                  formKey: _fullNameKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Full Name is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces
                  ],
                ),
                RefactoredTextField(
                  name: 'Phone number',
                  controller: phoneController,
                  formKey: _phoneKey,
                  validator: (value) {
                    // Define a regex pattern for a valid phone number
                    final phoneRegex = RegExp(r'^[0-9]+$');

                    if (phoneController.text.isEmpty) {
                      return 'Phone number cannot be empty';
                    } else if (!phoneRegex.hasMatch(phoneController.text.trim())) {
                      return 'Enter a valid 10-digit phone number';
                    }

                    // Return null if the input is valid
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                RefactoredTextField(
                  name: 'Email',
                  controller: emailController,
                  formKey: _emailKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                RefactoredTextField(
                  name: 'Referral code',
                  controller: referrelCodeController,
                  formKey: _referralCodeKey,
                  obscureText: registrationScreenState.isReferrelCodeObscure,
                  suffix: GestureDetector(
                    onTap: () {
                      Provider.of<RegistrationScreenController>(context, listen: false).changeReferrelCodeVisibility();
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter, // Allow single line input
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Referrel code is required';
                    }
                    // Add additional password validation if needed
                    return null;
                  },
                ),
                RefactoredTextField(
                  name: 'Password',
                  controller: passwordController,
                  formKey: _passwordKey,
                  obscureText: registrationScreenState.isPassObscure,
                  suffix: GestureDetector(
                    onTap: () {
                      Provider.of<RegistrationScreenController>(context, listen: false).changePassVisibility();
                    },
                    child: Icon(
                      registrationScreenState.isPassObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    // Add additional password validation if needed
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter, // Allow single line input
                  ],
                ),
                RefactoredTextField(
                  name: 'Confirm Password',
                  controller: confirmPasswordController,
                  formKey: _confirmPasswordKey,
                  obscureText: registrationScreenState.isConformPassObscure,
                  suffix: GestureDetector(
                    onTap: () {
                      Provider.of<RegistrationScreenController>(context, listen: false).changeConfirmPassVisibility();
                    },
                    child: Icon(
                      registrationScreenState.isConformPassObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter, // Allow single line input
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            registrationScreenState.isLoading
                ? ReusableLoadingWidget()
                : GestureDetector(
                    onTap: () {
                      if (_fullNameKey.currentState!.validate() &&
                          _phoneKey.currentState!.validate() &&
                          _emailKey.currentState!.validate() &&
                          _referralCodeKey.currentState!.validate() &&
                          _passwordKey.currentState!.validate() &&
                          _confirmPasswordKey.currentState!.validate()) {
                        // All form fields are valid, navigate to the next screen

                        Provider.of<RegistrationScreenController>(context, listen: false)
                            .onRegistration(
                          userName: fullNameController.text.trim(),
                          email: emailController.text.trim(),
                          pass: passwordController.text.trim(),
                          referrelCode: referrelCodeController.text.trim(),
                          phoneNumber: phoneController.text.trim(),
                        )
                            .then((value) {
                          if (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RegistartionOtpVerificationScreen(phNumber: phoneController.text.trim()),
                              ),
                            );
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
                          "REGISTER",
                          style: TextStyle(color: ColorConstant.mykuriWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Login here"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
