

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/content_view.dart';
import 'package:get/get.dart';

import '../../../base/basevm.dart';
import '../../../network/apis/api_status.dart';
import '../../../network/apis/user_service.dart';
import '../../../network/models/user_response_model.dart';

class MoreScreenVM extends BaseVM {


  logout() async{
    showOkLogOutAlertDialog(title: "Log out",message: "Are you sure you want to log out ?" ,fullyCapitalizedForMaterial:false,okLabel:"Log out",cancelLabel:"Cancel",isDestructiveAction:true)
        .then((value) => {
      if (value.index == 0 ){
        logOutUser()
      }
    });
  }
}
