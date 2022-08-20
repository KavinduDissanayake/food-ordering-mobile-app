
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/screens/login/loginScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import './const/colors.dart';
import 'const/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    GetMaterialApp materialApp = GetMaterialApp(
      theme:Themes.light,
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
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
