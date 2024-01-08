import 'package:flutter/material.dart';
import 'package:mykuri/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ResetPasswordScreenService extends ChangeNotifier {
  Future<APIResponse> onResetPassword({
    required String token,
    required Map<String, dynamic> body,
    required Locale language,
  }) async {
    final APIResponse response = await ApiHelper.postData(
        body: body,
        endPoint: "/change-password",
        header: ApiHelper.getApiHeader(
          access: token,
        ));
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }
}
