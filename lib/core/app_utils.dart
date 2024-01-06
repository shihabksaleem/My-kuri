import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../app_config/app_config.dart';

class AppUtils {
  //write datas need to use across all parts of the app here

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline() async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (isOnline) {
      return true;
    } else {
      // oneTimeSnackBar('No network connection!');
      return false;
    }
  }

  // /get access token
  static Future<String?> getAccessKey() async {
    // Create storage
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // Read value
    String? loginData = await storage.read(key: AppConfig.LOGIN_DATA);

    if (loginData != null) {
      final access = jsonDecode(loginData)['access'];
      return access;
    } else {
      return null;
    }
  }

  // /get access token
  static Future<String?> getUserId() async {
    // Create storage
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // Read value
    String? loginData = await storage.read(key: AppConfig.LOGIN_DATA);

    if (loginData != null) {
      final userId = jsonDecode(loginData)['user_id'];
      return userId;
    } else {
      return null;
    }
  }

//one time snackbar
  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    required BuildContext context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context)
        // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Colors.red,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(bottom: MediaQuery.of(context ?? context).size.height - 100, right: 20, left: 20)
            : null,
      ),
    );
  }
}
