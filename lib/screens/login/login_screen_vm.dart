

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/basevm.dart';

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


  loginUser() async {
    //check validations field
    //  if(!validationField()) {
    //    return;
    //  }
    showOkCancelAlertDialog(title: "Test",message: "Test" );

  }


}
