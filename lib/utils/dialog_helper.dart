
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
            //color: AppColors.textBlackColor
          )),
      messageText: Text(message,
          style: TextStyle(
            // fontFamily: FontFamily.rubikRegular,
            fontSize: 15,
            //  color: AppColors.textBlackColor
          )),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
     AppColor.alertGreenColor,
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
  //
  // void warningSnackBar(String title, String message) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     titleText: Text(title,
  //         style: TextStyle(
  //           // fontFamily: FontFamily.rubikBold,
  //           fontSize: 20,
  //           // color: AppColors.textBlackColor
  //         )),
  //     messageText: Text(message,
  //         style: TextStyle(
  //           // fontFamily: FontFamily.rubikRegular,
  //           fontSize: 15,
  //           //  color: AppColors.textBlackColor
  //         )),
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Get.isDarkMode ? Themes.darkYellow : Themes.lightYellow,
  //     isDismissible: true,
  //     //  dismissDirection: SnackDismissDirection.HORIZONTAL,
  //   );
  // }
  //
  // void errorSnackBar(String title, String message) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     titleText: Text(title,
  //         style: TextStyle(
  //           // fontFamily: FontFamily.rubikBold,
  //           fontSize: 20,
  //           // color: AppColors.textBlackColor
  //         )),
  //     messageText: Text(message,
  //         style: TextStyle(
  //           // fontFamily: FontFamily.rubikRegular,
  //           fontSize: 15,
  //           // color: AppColors.textBlackColor
  //         )),
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Get.isDarkMode ? Themes.darktRed : Themes.lightRed,
  //     isDismissible: true,
  //     // dismissDirection: SnackDismissDirection.HORIZONTAL,
  //   );
  // }
  //
  // //hide loading
  // void hideLoading() {
  //   if (Get.isDialogOpen!) Get.back();
  // }
  //
  // void showLoading() {
  //   Get.dialog(Dialog(
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       child: SizedBox(
  //         width: 200,
  //         height: 200,
  //         child: Center(
  //           // Aligns the container to center
  //               child: CircularProgressIndicator(
  //             color: Colors.white,
  //           )
  //           // child: Lottie.asset('assets/animations/loading.json',
  //           //     width: 200, height: 200),
  //         ),
  //       )));
  // }
}
