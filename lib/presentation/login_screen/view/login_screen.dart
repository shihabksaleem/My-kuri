import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:mykuri/presentation/forgot_password_screen/view/forgot_password_screen.dart';
import 'package:mykuri/presentation/get_started_screen/view/get_started_screen.dart';
import 'package:mykuri/presentation/login_screen/controllers/login_screen_controller.dart';
import 'package:mykuri/presentation/registration_otp_verification_screen/view/registration_otp_verification_screen.dart';
import 'package:mykuri/presentation/registration_screen/view/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginScreenController = Provider.of<LoginScreenController>(context);
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
                  style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Log into your My Kuri account"),
              SizedBox(height: 60),
              RefactoredTextField(controller: userNameController, name: 'User name/phone number'),
              RefactoredTextField(
                controller: passController,
                name: 'Password',
                obscureText: loginScreenController.isPassObscure,
                suffix: GestureDetector(
                  onTap: () {
                    Provider.of<LoginScreenController>(context, listen: false).changePassVisibility();
                  },
                  child: Icon(
                    loginScreenController.isPassObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password ?'),
                  TextButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: Text(
                        "Click here",
                        style: TextStyle(fontSize: 14, color: ColorConstant.mykuriPrimaryBlue),
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
            loginScreenController.isLoading
                ? ReusableLoadingWidget()
                : GestureDetector(
                    onTap: () async {
                      await Provider.of<LoginScreenController>(context, listen: false)
                          .onLogin(
                              userName: userNameController.text.trim(),
                              password: passController.text.trim(),
                              language: Locale('en'))
                          .then((value) {
                        if (value) {
                          loginScreenController.loginData?.user?.customer?.isVerified == 1
                              ? Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavScreen(),
                                  ),
                                  (route) => false,
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RegistartionOtpVerificationScreen(phNumber: userNameController.text.trim()),
                                  ),
                                );
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration:
                          BoxDecoration(color: ColorConstant.mykuriPrimaryBlue, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "LOG IN",
                          style: TextStyle(color: ColorConstant.mykuriWhite, fontWeight: FontWeight.bold),
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
                      Navigator.pushReplacement(
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
