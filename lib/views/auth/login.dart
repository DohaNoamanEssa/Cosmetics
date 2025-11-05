import 'package:cosmetics/core/logic/helper_methods.dart';
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.0.r).copyWith(top: 49.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 103.h),
              AppImage(imageURL: "login.png",
                  width: 284.w, height: 227.h,bottomSpace: 24.h,),
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
                withCountryCode: true,
                bottomSpace: 0,
              ),
              SizedBox(height: 8.h),

              AppInput(
                keyboardType: TextInputType.visiblePassword,
                hintText: "Your Password",
                isPassword: true,
               bottomSpace: 0,
              ),
              Align(
                alignment: Alignment.topRight,

                child: Padding(
                  padding: EdgeInsets.only(right: 13.w, top: 12.h, bottom: 43.h),
                  child: TextButton(
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Color(0xffD75D72)),
                    ),
                    onPressed: () {
                      goTo(ForgetPasswordView());
                    },
                  ),
                ),
              ),
              AppButton(buttonTitle: "Login", onPressed: () => goTo(HomeView())),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(),
    );
  }
}