import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/app_config.dart';

import '../../const/constants.dart';
import '../../utils/develpoer/dev_log.dart';
import '../../utils/device_utils.dart';
import 'package:http/http.dart' as http;

import '../../utils/user_preferences.dart';
import '../models/server_response_model.dart';
import '../models/user_response_model.dart';
import 'package:path/path.dart';


import 'package:async/async.dart';

import 'api_status.dart';


class UserServices {
  //login
  static Future<Object> authentication( String textEmail, String textPassword) async {
    String auth = "${AppConfig.baseUrl}/customer/login";

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      "Content-Type": "application/json",
      'x-api-key': AppConfig.apiKey,
    };

    // String deviceId = await DeviceUtils.getId();
    // String deviceName =  DeviceUtils.deviceName;


    // print("device id : $deviceId");
    // String body = json.encode({
    //   "email": "kavindu@gmail.com",
    //   "password":"12345678"
    // });
    var body = jsonEncode({ 'email': textEmail,'password': textPassword });

    try {
      var response = await http.post(Uri.parse(auth),
          body:  body,
          headers: requestHeaders);

      print(response);

      if (Constants.success == response.statusCode) {

        return Success(
            code: Constants.success,
            response: authResponseFromJson(response.body));
      } else {

        return Failure(
            code: Constants.unProcessable,
            errorResponse: serverResponseFromJson(response.body));
      }
    } on HttpException {

      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: Constants.invalidForamt, errorResponse: 'Invalid Format');
    } catch (e) {
      logger.e(e.toString());
      return Failure(
          code: Constants.unknownError, errorResponse: 'Unknown Error');
    }
  }

  //logout
  static Future<Object> logout() async {
    Get.deleteAll(force: true);

    String logout = AppConfig.baseUrl + "/logout";

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'x-api-key': AppConfig.apiKey,
      'authorization': SharedPrefs.getAccessToken() ?? "",
    };

    try {
      var response =
          await http.get(Uri.parse(logout), headers: requestHeaders);
      // print(response);
      if (Constants.success == response.statusCode) {
        return Success(
            code: Constants.success,
            response: serverResponseFromJson(response.body));
      } else {
        return Failure(
            code: Constants.unProcessable,
            errorResponse: serverResponseFromJson(response.body));
      }
    } on HttpException {
      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: Constants.invalidForamt, errorResponse: 'Invalid Format');
    } catch (e) {
      logger.e(e.toString());

      return Failure(
          code: Constants.unknownError, errorResponse: 'Unknown Error');
    }
  }

  //show profile
  static Future<Object> showProfile() async {
    String showProfile = AppConfig.baseUrl + "/profile";

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'x-api-key': AppConfig.apiKey,
      'authorization': SharedPrefs.getAccessToken() ?? "",
    };

    Get.log(SharedPrefs.getAccessToken() ?? "N/A Access Token ");

    try {
      var response =
          await http.get(Uri.parse(showProfile), headers: requestHeaders);
      print(response);

      if (Constants.success == response.statusCode) {
        return Success(
            code: Constants.success,
            response: authResponseFromJson(response.body));
      } else {
        return Failure(
            code: Constants.unProcessable,
            errorResponse: serverResponseFromJson(response.body));
      }
    } on HttpException {
      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: Constants.noInternt, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: Constants.invalidForamt, errorResponse: 'Invalid Format');
    } catch (e) {
      logger.e(e.toString());
      return Failure(
          code: Constants.unknownError, errorResponse: 'Unknown Error');
    }
  }










}
