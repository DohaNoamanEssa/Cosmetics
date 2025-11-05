import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatelessWidget {
   CreateAccountView({super.key});

  final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(13.0.r),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppImage(imageURL:
                  "logo.png",
                  height: 67.h,
                  width: 62.w,
                  topSpace: 40.h,
                  bottomSpace: 40.h,
                ),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 50.h),
                AppInput(
                  hintText:"Sara Samer" ,
                  labelText: "Your Name",
                  controller: nameController,
                ),
                AppInput(
                  keyboardType: TextInputType.phone,
                  labelText: "Phone Number",
                  hintText: "1022658997",
                  bottomSpace: 16.h,
                  withCountryCode: true,
                  controller: phoneController,
                ),

                AppInput(
                  hintText: "Create your password",
                  isPassword: true,
                  controller: passwordController,
                ),
                AppInput(
                  hintText: "Confirm password",
                  isPassword: true,
                  controller:confirmPasswordController ,


                ),
                SizedBox(height: 90.h),
                AppButton(buttonTitle: "Next",onPressed: (){
                  goTo(VerifyCodePage(
                    isForgetPassword: false,
                  ));
                },),
                SizedBox(height: 20.h),
                AppLoginOrRegister(isLogin: false,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
