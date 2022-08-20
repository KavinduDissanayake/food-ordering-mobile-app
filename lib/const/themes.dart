import 'package:flutter/material.dart';
import 'package:foodapp/const/colors.dart';

class Themes {
  Themes._();

  static final light = ThemeData(
    fontFamily: "Metropolis",
    primarySwatch: Colors.red,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColor.orange,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          AppColor.orange,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: AppColor.primary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: AppColor.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline5: TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.normal,
        fontSize: 25,
      ),
      headline6: TextStyle(
        color: AppColor.primary,
        fontSize: 25,
      ),
      bodyText2: TextStyle(
        color: AppColor.secondary,
      ),
    ),
  );
}
