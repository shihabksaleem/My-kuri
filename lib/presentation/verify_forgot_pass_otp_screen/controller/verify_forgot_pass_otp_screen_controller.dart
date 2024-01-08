import 'package:flutter/material.dart';
import 'package:mykuri/repository/api/forgot_password_screen/models/frogot_pass_otp_verification_res_model.dart';

import '../../../repository/api/forgot_password_screen/service/forgot_password_screen_service.dart';

class VerifyForgotPassOtpScreenController extends ChangeNotifier {
  bool isPostLoading = false;
  bool isResendLoading = false;
  ForgotPassOtpVerificationResModel? forgotPassVerificationResModel;

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

  Future<bool> verifyOtp({required String OTP, required String userName}) async {
    isPostLoading = true;
    notifyListeners();
    final response = await ForgotPasswordScreenServices().verifyOtp(
      body: {"otp": OTP, "username": userName},
      language: Locale('en'), // not used
    );

    try {
      if (response.error != true) {
        forgotPassVerificationResModel = response.data;
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
