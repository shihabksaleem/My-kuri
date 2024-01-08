import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:mykuri/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';
import '../models/login_res_model.dart';

class LoginScreenServices {
  Future<APIResponse> onLogin({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/login", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      LoginResModel redData = LoginResModel.fromJson(response.data);

      return APIResponse(data: redData, error: false, errorMessage: '');
    }
  }
}
