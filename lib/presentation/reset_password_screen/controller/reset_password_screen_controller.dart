import 'package:flutter/material.dart';
import 'package:mykuri/repository/api/reset_password_screen/service/reset_password_screen_service.dart';

class ResetPasswordScreenController extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> onResetPassword({
    required String cPass,
    required String pass,
    required String token,
  }) async {
    isLoading = true;
    notifyListeners();
    final response = await ResetPasswordScreenService().onResetPassword(
      body: {
        "password": pass,
        "cpassword": cPass,
      },
      language: Locale('en'),
      token: token,
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
