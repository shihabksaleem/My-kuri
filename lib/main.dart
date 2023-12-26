import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:mykuri/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.karlaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
