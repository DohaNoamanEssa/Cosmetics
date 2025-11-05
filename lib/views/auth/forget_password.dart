import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(13.0.r).copyWith(top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0.h),
                  child: AppImage(
                    imageURL: "logo.png",
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Forget Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: Color(0xFF434c6D),
                  ),
                ),
                SizedBox(height: 40.h),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Color(0xff8E8EA9)),
                    children: [
                      TextSpan(text: 'Please enter your phone number below\n'),
                      TextSpan(text: 'to recovery your password.'),
                    ],
                  ),
                ),

                SizedBox(height: 45.h),
                AppInput(
                  labelText: "Phone Number",
                  withCountryCode: true,
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 56.h),

                AppButton(
                  buttonTitle: "Next",
                  onPressed: () {
                    goTo(VerifyCodePage(isForgetPassword: true,));
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
