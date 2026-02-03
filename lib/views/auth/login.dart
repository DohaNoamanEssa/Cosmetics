import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  DataState? state;

  Future<void> sendData() async {
    state = DataState.loading;
    setState(() {

    });
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    final resp = await DioHelper.sendData(
      path: "api/Auth/login",
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );
    if (resp!.isSuccess) {
      state =DataState.success;
      showMsg("Login Success");
      //Save Data In Shared Preferences
      // resp.data need to ne saved in shared preferences
      final model =UserData.fromJson(resp.data);
      await CacheHelper.saveUserData(model);
      goTo(HomeView(),canPop: false);

    } else {
      state =DataState.failed;
      showMsg(resp.msg, isError: true);
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if (isLoginClicked) {
              formKey.currentState?.validate();
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13.0.r).copyWith(top: 103.h),
            child: Column(
              children: [
                AppImage(image: "login.png", bottomSpace: 24.h),
                Text(
                  "Login Now",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  "Please enter the details below to continue",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8E8EA9),
                  ),
                ),
                SizedBox(height: 25.h),
                AppInput(
                  keyboardType: TextInputType.phone,
                  labelText: "Phone Number",
                  validator: InputValidator.phoneValidator,

                  withCountryCode: true,
                  controller: phoneController,
                  bottomSpace: 0,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value;
                  },
                ),
                SizedBox(height: 8.h),

                AppInput(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Your Password",
                  controller: passwordController,
                  isPassword: true,
                  bottomSpace: 0,
                  validator: InputValidator.passwordValidator,
                ),
                Align(
                  alignment: Alignment.topRight,

                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 13.w,
                      top: 12.h,
                      bottom: 43.h,
                    ),
                    child: TextButton(
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Color(0xffD75D72)),
                      ),
                      onPressed: () {
                        goTo(ForgetPasswordView(), canPop: true);
                      },
                    ),
                  ),
                ),
                AppButton(
                  buttonTitle: "Login",
                  isLoading: state==DataState.loading ,
                  onPressed: () {
                    isLoginClicked = true;
                    if (formKey.currentState!.validate()) {
                      sendData();
                    }

                    // goTo(HomeView());
                  },
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(),
    );
  }
}

class UserData {

  late final String token;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json){
    token = json['token']??"";
    user = UserModel.fromJson(json['user']);
  }


}

class UserModel {

  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    username = json['username']??"";
    email = json['email']??"";
    phoneNumber = json['phoneNumber']??"";
    countryCode = json['countryCode']??"";
    role = json['role']??"";
    profilePhotoUrl = json['profilePhotoUrl']??"";
  }


}
