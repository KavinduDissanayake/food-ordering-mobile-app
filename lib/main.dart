import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/screens/forgetPwScreen.dart';
import 'package:foodapp/screens/homeScreen.dart';
import 'package:foodapp/screens/intro/introScreen.dart';
import 'package:foodapp/screens/intro/landingScreen.dart';
import 'package:foodapp/screens/login/loginScreen.dart';
import 'package:foodapp/screens/menuScreen.dart';
import 'package:foodapp/screens/moreScreen.dart';
import 'package:foodapp/screens/offerScreen.dart';
import 'package:foodapp/screens/profileScreen.dart';
import 'package:foodapp/screens/signUpScreen.dart';
import 'package:foodapp/screens/tab_bar/main_tab_bar.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import './const/colors.dart';
import 'config/app_config.dart';
import 'const/themes.dart';

void main() {
  AppConfig.appFlavor = Flavor.DEVELOPMENT;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    GetMaterialApp materialApp = GetMaterialApp(
      theme: Themes.light,
      //themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
     // home: MainTabBar(),
      home: LoginScreen(),
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
