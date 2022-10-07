
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodapp/screens/login/loginScreen.dart';
import 'package:foodapp/screens/tab_bar/main_tab_bar.dart';
import 'package:foodapp/utils/user_preferences.dart';
import 'package:get/get_core/src/get_main.dart';

class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContentViewState();
  }
}

class ContentViewState extends State<ContentView> {

  bool isLogin = false;
  @override
  void initState()  {
    super.initState();
    // Get the token each time the application loads

    checkStatus ();

  }

  checkStatus () async{
    isLogin =    SharedPrefs.getUserLogin() ?? false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.theme.backgroundColor,
      body: Center(child: isLogin ? MainTabBar() :LoginScreen() ),
    );
  }
}


