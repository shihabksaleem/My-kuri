import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykuri/presentation/forgot_password_screen/controller/forgot_password_screen_controller.dart';
import 'package:mykuri/presentation/login_screen/controllers/login_screen_controller.dart';
import 'package:mykuri/presentation/splash_screen/controller/common_controller.dart';
import 'package:mykuri/presentation/splash_screen/splash_screen.dart';
import 'package:mykuri/presentation/verify_forgot_pass_otp_screen/controller/verify_forgot_pass_otp_screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordScreenController()),
        ChangeNotifierProvider(create: (context) => VerifyForgotPassOtpScreenController()),
      ],
      child: MaterialApp(
        navigatorKey: CommonController.navigatorState,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.karlaTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
