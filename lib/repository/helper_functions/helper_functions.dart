import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mykuri/presentation/get_started_screen/view/get_started_screen.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';

class HelperFunctions {
  static Future<void> logOut(BuildContext context) async {
    // clear shared preferences and navigate to login methode screen

// Create storage
    final storage = new FlutterSecureStorage();

// Delete all
    await storage.deleteAll().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => GetStartedScreen(),
          ),
          (route) => false);
    });
  }
}
