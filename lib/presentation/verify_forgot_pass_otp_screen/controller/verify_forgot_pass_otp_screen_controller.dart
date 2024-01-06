import 'package:flutter/material.dart';

import '../../../repository/api/forgot_password_screen/service/forgot_password_screen_service.dart';

class VerifyForgotPassOtpScreenController extends ChangeNotifier {
  bool isPostLoading = false;
  bool isResendLoading = false;

  Future<bool> resendOtp({required String userName}) async {
    isResendLoading = true;
    notifyListeners();
    final response = await ForgotPasswordScreenServices().sendOtp(
      body: {"username": userName},
      language: Locale('en'),
    );

    try {
      if (response.error != true) {
        isResendLoading = false;
        notifyListeners();

        return true;
      } else {
        isResendLoading = false;
        notifyListeners();

        return false;
      }
    } catch (e) {
      isResendLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }

  Future<bool> verifyOtp({required String OTP}) async {
    isPostLoading = true;
    notifyListeners();
    final response = await ForgotPasswordScreenServices().verifyOtp(
      body: {"otp": OTP},
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
