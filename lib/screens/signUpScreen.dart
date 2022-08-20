import 'package:flutter/material.dart';
import 'package:foodapp/utils/device/device_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../const/colors.dart';
import 'login/loginScreen.dart';
import '../utils/helper.dart';
import 'login/widgets/custom_textInput_field.dart';
import 'login/widgets/custom_textinput_password.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: SafeArea(
        child: DeviceUtils.isTablet(context) ?
      Row(

        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      Helper.getAssetName("login_web_back.jpg", "background")),
                  fit: BoxFit.fill,
                ),
              ),
              height:  Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context)/2,
              child: WebLeftViewWidget()
          ),
          Container(
            height:  Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context)/2,
            child: SignUpFromWidget(),
          ),

        ],
      ):SignUpFromWidget(),
        ),
    ));
  }
}

class SignUpFromWidget extends StatelessWidget {
  const SignUpFromWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Sign Up",
            style: Helper.getTheme(context).headline6,
          ),
          Spacer(),
          Text(
            "Add your details to sign up",
          ),
          Spacer(),
          CustomTextInputField(
            isValidation:true,
            hintText: 'Name',
            errorText: 'Incorrect Name format',
            textInputAction: TextInputAction.next,
            onChanged: (val){

            },
          ),
          Spacer(),

          CustomTextInputField(
            isValidation:true,
            hintText: 'Email',
            errorText: 'Incorrect Email format',
            textInputAction: TextInputAction.next,
            onChanged: (val){

            },
          ),

          const Spacer(),
          CustomPasswordInputField(
            isValidation:false,
            hintText: 'Password',
            errorText: 'Incorrect password content',
            textInputAction: TextInputAction.next,
            onChanged: (val){

            },
          ),

          const Spacer(),
          CustomPasswordInputField(
            isValidation:false,
            hintText: 'Confirm Password',
            errorText: 'Incorrect password content',
            textInputAction: TextInputAction.next,
            onChanged: (val){

            },
          ),
          Spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Sign Up"),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
            Get.to(LoginScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account?"),
                Text(
                  "Login",
                  style: TextStyle(
                    color: AppColor.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
