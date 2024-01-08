import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mykuri/app_config/app_config.dart';
import 'package:mykuri/repository/api/loign_screen/models/login_res_model.dart';
import 'package:mykuri/repository/api/registration_otp_verification_screen/service/registration_otp_verification_screen_service.dart';

class RegistrationOtpVerificationScreenController extends ChangeNotifier {
  bool isPostLoading = false;
  bool isResendLoading = false;
  LoginResModel? loginData;
  // Create storage
  final storage = new FlutterSecureStorage();

  Future<bool> verifyOtp({
    required String userPhoneNumber,
    required String otp,
  }) async {
    isPostLoading = true;
    notifyListeners();
    final response = await RegistrationOtpVerificationScreenService().verifyOtp(
      body: {"username": userPhoneNumber, "otp": otp},
      language: Locale('en'),
    );

    try {
      if (response.error != true) {
        loginData = response.data;

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

        isPostLoading = false;
        notifyListeners();

        return true;
      } else {
        isPostLoading = false;
        notifyListeners();

        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }

  Future<bool> resendOtp({required String userPhoneNumber}) async {
    isPostLoading = true;
    notifyListeners();
    final response = await RegistrationOtpVerificationScreenService().resendOtp(
      body: {"username": userPhoneNumber},
      language: Locale('en'), // not used
    );

    try {
      if (response.error != true) {
        isPostLoading = false;
        notifyListeners();

        return true;
      } else {
        isPostLoading = false;
        notifyListeners();

        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }
}
