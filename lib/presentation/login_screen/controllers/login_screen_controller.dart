import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mykuri/app_config/app_config.dart';
import 'package:mykuri/repository/api/loign_screen/models/login_res_model.dart';
import 'package:mykuri/repository/api/loign_screen/service/login_screen_service.dart';

class LoginScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;

  LoginResModel? loginData;
  // Create storage
  final storage = new FlutterSecureStorage();

// login
  Future<bool> onLogin({required String userName, required String password, required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await LoginScreenServices().onLogin(body: {"username": userName, "password": password}, language: language);
      if (fetchedData.error != true) {
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token,
            "name": loginData!.user?.name,
            "email": loginData!.user?.email,
            "user_id": loginData!.user?.id,
          };
          print(sharedData);

          ///this is where first time the data is stored to storage as map converted json.

          await storage.write(key: AppConfig.LOGIN_DATA, value: jsonEncode(sharedData));
        }

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }
}
