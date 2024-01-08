import 'package:flutter/material.dart';
import 'package:mykuri/repository/api/registration_screen/service/registration_screen_service.dart';

class RegistrationScreenController extends ChangeNotifier {
  bool isLoading = false;
  bool isPassObscure = true;
  bool isConformPassObscure = true;
  bool isReferrelCodeObscure = true;

  //Registration

  Future<bool> onRegistration(
      {required String userName,
      required String email,
      required String pass,
      required String referrelCode,
      required String phoneNumber}) async {
    isLoading = true;
    notifyListeners();
    final response = await RegistrationScreenServices().onRegistration(
      body: {
        "name": userName,
        "email": email,
        "password": pass,
        "referrel_code": referrelCode,
        "mobile": phoneNumber,
      },
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

// change visibility of password
  changePassVisibility() {
    isPassObscure = !isPassObscure;
    notifyListeners();
  }

// change visibility of confirm password field
  changeConfirmPassVisibility() {
    isConformPassObscure = !isConformPassObscure;
    notifyListeners();
  }

// change visibility of
  changeReferrelCodeVisibility() {
    isReferrelCodeObscure = !isReferrelCodeObscure;
    notifyListeners();
  }
}
