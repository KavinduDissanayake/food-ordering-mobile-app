import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/content_view.dart';
import 'package:foodapp/screens/forgetPwScreen.dart';
import 'package:foodapp/screens/homeScreen.dart';
import 'package:foodapp/screens/intro/introScreen.dart';
import 'package:foodapp/screens/intro/landingScreen.dart';
import 'package:foodapp/screens/login/loginScreen.dart';
import 'package:foodapp/screens/menu/menuScreen.dart';
import 'package:foodapp/screens/login/more/moreScreen.dart';
import 'package:foodapp/screens/offerScreen.dart';
import 'package:foodapp/screens/profileScreen.dart';
import 'package:foodapp/screens/signUpScreen.dart';
import 'package:foodapp/screens/tab_bar/main_tab_bar.dart';
import 'package:foodapp/utils/http_cerificate_error/certificate_error.dart';
import 'package:foodapp/utils/user_preferences.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import './const/colors.dart';
import 'config/app_config.dart';
import 'const/themes.dart';

void main() async{
  AppConfig.appFlavor = Flavor.DEVELOPMENT;

  // Initialize GetStorage instance.
  await GetStorage.init();

  // Initialize SharedPrefs instance
  await SharedPrefs.init();

  //Http issue fixed
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    GetMaterialApp materialApp = GetMaterialApp(
      theme: Themes.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
     // home: MainTabBar(),
      home: ContentView(),
      //  home:UserTabScreen(),
    );

    ScreenUtilInit screenUtilInit = ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return materialApp;
        });

    return screenUtilInit;
  }
}
