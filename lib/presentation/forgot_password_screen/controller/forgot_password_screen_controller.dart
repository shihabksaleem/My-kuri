import 'package:flutter/material.dart';
import 'package:mykuri/repository/api/forgot_password_screen/service/forgot_password_screen_service.dart';

class ForgotPasswordScreenController extends ChangeNotifier {
  bool isLoading = false;
  Future<bool> sendOtp({required String userName}) async {
    isLoading = true;
    notifyListeners();
    final response = await ForgotPasswordScreenServices().sendOtp(
      body: {"username": userName},
      language: Locale('en'),
    );

    try {
      if (response.error != true) {
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
