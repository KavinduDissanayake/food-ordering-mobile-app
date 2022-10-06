import 'package:flutter/material.dart';
import 'package:foodapp/screens/forgetPwScreen.dart';
import 'package:foodapp/screens/login/widgets/custom_textInput_field.dart';
import 'package:foodapp/screens/login/widgets/custom_textinput_password.dart';
import 'package:foodapp/utils/device/device_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/colors.dart';
import '../forgetPwScreen.dart';
import '../signUpScreen.dart';
import '../../utils/helper.dart';
import 'login_screen_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/loginScreen";

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  //viewModel
  final LoginScreenVM vm = Get.put(LoginScreenVM());

  @override
  void dispose() {
    Get.delete<LoginScreenVM>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: DeviceUtils.isTablet(context)
              ? WebViewSideWidget(viewModel: vm)
              : LoginFromWidget(viewModel: vm),
        ),
      ),
    );
  }
}

class WebViewSideWidget extends StatelessWidget {
  final LoginScreenVM viewModel;

  const WebViewSideWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    Helper.getAssetName("login_web_back.jpg", "background")),
                fit: BoxFit.fill,
              ),
            ),
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context) / 2,
            child: const WebLeftViewWidget()),
        SizedBox(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context) / 2,
          child: LoginFromWidget(
            viewModel: viewModel,
          ),
        ),
      ],
    );
  }
}

class WebLeftViewWidget extends StatelessWidget {
  const WebLeftViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: Helper.getScreenHeight(context) / 8,
            width: Helper.getScreenWidth(context) / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(25.0),
            child: Image.asset(
              Helper.getAssetName("MealMonkeyLogo.png", "virtual"),
            ),
          ),
          Text(
            "App Name",
            style: Helper.getTheme(context)
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
            style: Helper.getTheme(context)
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class LoginFromWidget extends StatelessWidget {
  final LoginScreenVM viewModel;

  const LoginFromWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Login",
            style: Helper.getTheme(context).headline6,
          ),
          const Spacer(),
          const Text('Add your details to login'),
          const Spacer(),

          Obx(()=>(
              CustomTextInputField(
                isValidation:viewModel.validateEmail.value,
                hintText: 'Email',
                errorText: 'Incorrect email address format',
                textInputAction: TextInputAction.next,
                onChanged: (val){
                  viewModel.emailValidation(val);
                },
              )
          )),

          const Spacer(),
          Obx(()=>(
              CustomPasswordInputField(
                isValidation:viewModel.validatePassword.value,
                hintText: 'Password',
                errorText: 'Incorrect password content',
                textInputAction: TextInputAction.done,
                onChanged: (val){
                  viewModel.passwordValidation(val);
                },
              )
          )),
          const Spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {

               // if(viewModel.validationField()){
                  viewModel.loginUser();
              //  }

              },
              child: const Text("Login"),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ForgetPwScreen.routeName);
            },
            child: const Text("Forget your password?"),
          ),
          const Spacer(
            flex: 2,
          ),
          const Text("or Login With"),
          const Spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(
                    0xFF367FC0,
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Helper.getAssetName(
                      "fb.png",
                      "virtual",
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("Login with Facebook")
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(
                    0xFFDD4B39,
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Helper.getAssetName(
                      "google.png",
                      "virtual",
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text("Login with Google")
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(SignUpScreen.routeName);
              Get.to(const SignUpScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have an Account?"),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppColor.orange,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
