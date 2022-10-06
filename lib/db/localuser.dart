
// import 'package:untitled/develpoer/dev_log.dart';
// import 'package:untitled/network/models/user_model.dart';
// import 'package:untitled/utils/helper/user_preferences.dart';

import '../network/models/user_response_model.dart';
import '../utils/develpoer/dev_log.dart';
import '../utils/user_preferences.dart';

class LocalUser {

  // //save local user
  saveLocalUser(User? _user){

    SharedPrefs.setUserLogin(true);
    SharedPrefs.setAccessToken(_user?.accessToken ?? "");

    logger.i(
        "Login credentials User Login: ${SharedPrefs.getUserLogin()} ,"
            "\n User AccessToken: ${SharedPrefs.getAccessToken()}"
            "\n User Role: ${SharedPrefs.getUserRole()}"
            "\n User ID: ${SharedPrefs.getUserID()}"
            "\n User ID: ${SharedPrefs.getUserName()}"
            "");
  }



  Type getCurrentUser(){
    return SharedPrefs;
  }
  //remove local user
  removeLocalUser(){
    SharedPrefs.instance.clear();
  }


}