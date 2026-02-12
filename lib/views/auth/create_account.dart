import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatelessWidget {
   const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(13.0.r),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40.h,),
              AppImage(image:
                "logo.png",
                height: 67.h,
                width: 62.w,
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
              ),
              AppInput(
                keyboardType: TextInputType.phone,
                labelText: "Phone Number",
                hintText: "1022658997",
                bottomSpace: 16.h,
                withCountryCode: true,
              ),

              AppInput(
                hintText: "Create your password",
                isPassword: true,
              ),
              AppInput(
                hintText: "Confirm password",
                isPassword: true,


              ),
              SizedBox(height: 90.h),
              AppButton(buttonTitle: "Next",onPressed: (){
                goTo(VerifyCodeView(
                  isForgetPassword: false,
                ),canPop: true);
              },),
              SizedBox(height: 20.h),
              AppLoginOrRegister(isLogin: false,),
            ],
          ),
        ),
      ),
    );
  }
}
