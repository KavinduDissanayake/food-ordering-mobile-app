

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/content_view.dart';
import 'package:get/get.dart';

import '../../base/basevm.dart';
import '../../network/apis/api_status.dart';
import '../../network/apis/user_service.dart';
import '../../network/models/user_response_model.dart';

class LoginScreenVM extends BaseVM {

  var textEmailText = "";
  var validateEmail = false.obs;


  var textPasswordText = "";
  var validatePassword = false.obs;


  var isIosDevice = false.obs;
  //life cycle
  @override
  onInit() {
    super.onInit();

  }


  //functions
  emailValidation(String emailText) {
    textEmailText =  emailText;
    validateEmail.value = isValidEmail(textEmailText);
    showInfoLogger(info: 'EmailText $emailText validations ${validateEmail.value}');
  }
  passwordValidation(String passwordText) {
    textPasswordText =  passwordText;
    validatePassword.value = isPassword(textPasswordText);
    showInfoLogger(info: 'PasswordText $passwordText validations ${validatePassword.value}');
  }


  bool validationField(){
    if (validateEmail.isFalse){
    // showWarningMessage(('emailErrorTitle').tr,('emailErrorMessage').tr);
      return false;
    }
    if (validatePassword.isFalse){
    // showWarningMessage(('passwordErrorTitle').tr,('passwordErrorMessage').tr);
      return false;
    }
    return true;
  }


  // loginUser() async {
  //   //check validations fieldyo
  //   //  if(!validationField()) {
  //   //    return;
  //   //  }
  //   showOkCancelAlertDialog(title: "Test",message: "Test" );
  //
  // }

  loginUser() async {
    //check validations field
    //  if(!validationField()) {
    //    return;
    //  }
    //
    // textEmailText = "customer@sample.com";
    // textPasswordText = "12345678";

   showIndicator();

    var response =
    await UserServices.authentication(textEmailText, textPasswordText);
    //success response
    if (response is Success) {
      hideIndicator();

      //access response
     User? _user = (response.response as AuthResponseFromJson).payload;

      //save local user
      saveLocalUser(_user);

      //navigation
      Timer(const Duration(seconds: 4), () {
        Get.offAll(const ContentView());
      });

      showSuccessMessage(('login').tr, ('loginSuccess').tr);
    }
    //error response
    if (response is Failure) {
      hideIndicator();
      errorAlertHandler(response, errorTile: ('loginFailed').tr);
    }
  }



}
