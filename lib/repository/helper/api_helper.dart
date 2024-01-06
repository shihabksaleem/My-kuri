import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mykuri/core/app_utils.dart';
import 'package:mykuri/presentation/splash_screen/controller/common_controller.dart';

import '../../app_config/app_config.dart';
import 'api_response.dart';

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': 'Bearer $access'};
    } else if (dbName != null) {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'dbName': dbName,
      };
    } else {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
  }

  static getData({required String endPoint, required Map<String, String> header, String? finalUrl}) async {
    if (await AppUtils.isOnline()) {
      final uri = Uri.parse(finalUrl ?? (AppConfig.BASE_URL + endPoint));
      // AppUtils.logger.i(uri);
      final res = await http.get(uri, headers: header);
      // AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print(resBody);
        if (resBody['status'] == '1' || res.statusCode == 200) {
          print(resBody);
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          print(resBody);

          AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
              context: CommonController.navigatorState.currentContext!);
          return APIResponse(data: resBody, error: true, errorMessage: resBody['message'] ?? "Something_went_wrong");
        }
      } else {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
            context: CommonController.navigatorState.currentContext!);
        return APIResponse(data: '', error: true, errorMessage: "Something_went_wrong");
      }
    } else {
      if (CommonController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No_internet_connection",
            context: CommonController.navigatorState.currentContext!);
      }
    }
  }

  //for post
  ///endpoint is applied olny if finalUrl is empty
  static postData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.BASE_URL + endPoint);
      print("uri :$uri");
      // AppUtils.logger.i(uri);
      // print(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == '1') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
              context: CommonController.navigatorState.currentContext!);
          return APIResponse(
              data: resBody, error: true, errorMessage: resBody['message'].toString() ?? "Something_went_wrong");
        }
      } else {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
            context: CommonController.navigatorState.currentContext!);
        return APIResponse(data: res.body, error: true, errorMessage: "Something_went_wrong");
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      if (CommonController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No_internet_connection",
            context: CommonController.navigatorState.currentContext!);
      }
    }
  }

  //patch
  static patchData(
      {required String endPoint, required Map<String, String> header, required Map<String, dynamic> body}) async {
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      // try{
      final uri = Uri.parse(AppConfig.BASE_URL + endPoint);
      // AppUtils.logger.i(uri);
      // print(header);
      final res = await http.patch(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == '1') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
              context: CommonController.navigatorState.currentContext!);
          return APIResponse(
              data: resBody, error: true, errorMessage: resBody['message']?.toString() ?? "Something_went_wrong");
        }
      } else {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        AppUtils.oneTimeSnackBar(resBody['message']?.toString() ?? "Something_went_wrong",
            context: CommonController.navigatorState.currentContext!);
        return APIResponse(
          data: res.body,
          error: true,
          errorMessage: "Something_went_wrong",
        );
      }
    } else {
      if (CommonController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No_internet_connection",
            context: CommonController.navigatorState.currentContext!);
      }
    }
  }

  static bool isRequestSucceeded(int statusCode) {
    if (statusCode == 401) {}

    ///if 402 ie. subscription expired
    if (statusCode == 402) {}

    ///todo : need to handle in other way
    // return statusCode >= 200 && statusCode < 401||statusCode==500;
    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }
}
