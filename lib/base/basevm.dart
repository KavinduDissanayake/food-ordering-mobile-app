import 'dart:async';
import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/base/validations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../const/constants.dart';
import '../content_view.dart';
import '../db/localuser.dart';
import '../network/apis/api_status.dart';
import '../network/models/server_response_model.dart';
import '../utils/develpoer/dev_log.dart';
import '../utils/dialog_helper.dart';
import 'alerts.dart';


class BaseVM extends GetxController with Validations,LocalUser,Alerts{



//error handle---------------------------------

//
  errorAlertHandler(Failure response,{String errorTile = "Loading failed",bool isLoggerOnly = false}) {
    //Error message
    String errorMessage = "";
    if (response.code == Constants.unProcessable) {
      String? _errorResponse =
          (response.errorResponse as ServerResponse).message;
      errorMessage = _errorResponse ?? "";
    } else {
      errorMessage = response.errorResponse as String;
    }

    logger.e(errorMessage);
    if(!isLoggerOnly){
      showErrorMessage(errorTile,errorMessage);
    }
  }
//
//
//
//indicator-----------------------------------
  showIndicator(){
    DialogHelper.shared.showLoading();
  }

  hideIndicator(){
    DialogHelper.shared.hideLoading();
  }


  //messages-----------------------------------
  showErrorMessage(String errorTitle,String errorMessage){
    DialogHelper.shared.errorSnackBar(errorTitle, errorMessage);
  }

  showSuccessMessage(String successTitle,String successMessage){
    DialogHelper.shared.successSnackBar(successTitle, successMessage);
  }

  showWarningMessage(String warningTitle,String warningMessage){
    DialogHelper.shared.warningSnackBar(warningTitle, warningMessage);
  }
//
//
  showErrorLogger({required String error}){
    logger.e(error);
  }
  showDebugLogger({required String debug}){
    logger.d(debug);
  }
  showInfoLogger({required String info}){
    logger.i(info);
  }
// //common api and  methods-----------------------------------
  logOutUser() async {

    //call logout api
    showSuccessMessage("Log out", "Success !");
    removeLocalUser();
    navigateToContentView();
  }
//
  navigateToContentView(){
    //navigation
    Timer(const Duration(seconds: 4), () {
      Get.offAll(const ContentView());
    });
  }

//   sendMessageMessageNotification(String message, String type, String contactUserID) async {
//
//     var response = await NotificationServices.sendWithMessage(
//         contactUserID, message, type, "normal");
//     //success response
//     if (response is Success) {
//       // showIndicator();
//       logger.i("client notification success !");
//     }
//     //error response
//     if (response is Failure) {
//       // hideIndicator();
//       errorAlertHandler(response,errorTile:('notificationError').tr);
//     }
//
//
//   }
//
//
//   // String getFileSizeString({required int bytes, int decimals = 0}) {
//   //   const suffixes = ["b", "kb", "mb", "gb", "tb"];
//   //   var i = (log(bytes) / log(1024)).floor();
//   //   return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
//   // }
//
//
//   Future<bool> isNotFoundURL({required String urlString}) async {
//     final url = Uri.parse(urlString);
//     http.Response response = await http.get(url);
//     if (response.statusCode == 200) {
//       print('exists');
//       return Future<bool>.value(false);
//     } else {
//
//      // logger.e(response.statusCode);
//       return Future<bool>.value(true);
//     }
//
//   }




}