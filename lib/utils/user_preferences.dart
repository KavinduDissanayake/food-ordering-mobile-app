import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  // Getter
  static bool? getBool(String key) => instance.getBool(key);

// Setter
  static Future<bool> setBool(String key, bool value) =>
      instance.setBool(key, value);

//login
  static const _kIsLogin = 'isLogin';

  static Future<bool> setUserLogin(bool value) =>
      instance.setBool(_kIsLogin, value);

  static bool? getUserLogin() => instance.getBool(_kIsLogin);

// accessToken
  static const _kAccessToken = 'accessToken';

  static Future<bool> setAccessToken(String value) =>
      instance.setString(_kAccessToken, value);

  static String? getAccessToken() => instance.getString(_kAccessToken);

// user role
  static const _kUserRole = 'userRole';

  static Future<bool> setUserRole(String value) =>
      instance.setString(_kUserRole, value);

  static String? getUserRole() => instance.getString(_kUserRole);

// user role
  static const _kUserName = 'userName';

  static Future<bool> setUserName(String value) =>
      instance.setString(_kUserName, value);

  static String? getUserName() => instance.getString(_kUserName);

// FCMToken
  static const _kFcmToken = 'fcmToken';

  static Future<bool> setFcmToken(String value) =>
      instance.setString(_kFcmToken, value);

  static String? getFcmToken() => instance.getString(_kFcmToken);

//CurrentUser ID
  static const _kUserID = 'userID';

  static Future<bool> setUserID(String value) =>
      instance.setString(_kUserID, value);

  static String? getUserID() => instance.getString(_kUserID);

// BageCount
  static const _kNCount = 'nCountInt';

  static Future<bool> setNotificationBadgeCountInt(int value) =>
      instance.setInt(_kNCount, value);

  static int? getNotificationBadgeCountInt() => instance.getInt(_kNCount);

  // BageCount
  static const _kNCountString = 'nCountString';

  static Future<bool> setNotificationBadgeCountString(String value) =>
      instance.setString(_kNCountString, value);

  static String? getNotificationBadgeCountString() =>
      instance.getString(_kNCountString);

  // BageCountIsSHow
  static const _kNisShowString = 'nCountShow';

  static Future<bool> setNotificationBadgeCountIsShow(bool value) =>
      instance.setBool(_kNisShowString, value);

  static bool? getNotificationBadgeCountIsShow() =>
      instance.getBool(_kNisShowString);

  static read(String key) async {
    return json.decode(instance.getString(key)!);
  }

  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
