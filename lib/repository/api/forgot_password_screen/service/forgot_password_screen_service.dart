import 'package:flutter/widgets.dart';
import 'package:mykuri/repository/api/forgot_password_screen/models/frogot_pass_otp_verification_res_model.dart';
import 'package:mykuri/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ForgotPasswordScreenServices {
  Future<APIResponse> sendOtp({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/forgot-password", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }

  Future<APIResponse> verifyOtp({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/forgot-otp", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      ForgotPassOtpVerificationResModel redData = ForgotPassOtpVerificationResModel.fromJson(response.data);
      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
