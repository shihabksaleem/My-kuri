import 'package:flutter/material.dart';
import 'package:mykuri/repository/api/loign_screen/models/login_res_model.dart';
import 'package:mykuri/repository/helper/api_helper.dart';
import 'package:mykuri/repository/helper/api_response.dart';

class RegistrationOtpVerificationScreenService extends ChangeNotifier {
  Future<APIResponse> verifyOtp({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/otp", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      LoginResModel redData = LoginResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }

  Future<APIResponse> resendOtp({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/resend-otp", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }
}
