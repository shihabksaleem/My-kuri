import 'package:flutter/widgets.dart';
import 'package:mykuri/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class RegistrationScreenServices {
  Future<APIResponse> onRegistration({required Map<String, dynamic> body, required Locale language}) async {
    final APIResponse response =
        await ApiHelper.postData(body: body, endPoint: "/register", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }
}
