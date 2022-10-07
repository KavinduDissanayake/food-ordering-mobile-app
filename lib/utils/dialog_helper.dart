
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';

class DialogHelper {
  static DialogHelper? _shared;

  DialogHelper._();

  static DialogHelper get shared => _shared ??= DialogHelper._();

  //Alerts
  void successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title,
          style: TextStyle(
            // fontFamily: FontFamily.rubikBold,
            fontSize: 20,
              color: Colors.white
          )),
      messageText: Text(message,
          style: TextStyle(
            // fontFamily: FontFamily.rubikRegular,
            fontSize: 15,
              color: Colors.white
          )),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:Color(0xff2e7d32),
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
  //
  void warningSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title,
          style: TextStyle(
            // fontFamily: FontFamily.rubikBold,
            fontSize: 20,
              color: Colors.white
          )),
      messageText: Text(message,
          style: TextStyle(
            // fontFamily: FontFamily.rubikRegular,
            fontSize: 15,
              color: Colors.white

            //  color: AppColors.textBlackColor
          )),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:Color(0xff787D2E),
      isDismissible: true,
      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
  //
  void errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title,
          style: TextStyle(
            // fontFamily: FontFamily.rubikBold,
            fontSize: 20,
              color: Colors.white

            // color: AppColors.textBlackColor
          )),
      messageText: Text(message,
          style: TextStyle(
            // fontFamily: FontFamily.rubikRegular,
            fontSize: 15,
              color: Colors.white

            // color: AppColors.textBlackColor
          )),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xff7D312E),
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
  //
  // //hide loading
  void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
  //
  void showLoading() {
    Get.dialog(Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            // Aligns the container to center
                child: CircularProgressIndicator(
              color: Colors.white,
            )
            // child: Lottie.asset('assets/animations/loading.json',
            //     width: 200, height: 200),
          ),
        )));
  }
}
