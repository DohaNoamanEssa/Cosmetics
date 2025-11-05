import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';


class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(13.0.r).copyWith(top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 40.0.h,bottom: 20.h),
                  child: AppImage(imageURL:
                  "logo.png",
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
                Text(
                  "Create Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: Color(0xFF434c6D),
                  ),
                ),
                SizedBox(height: 40.h),

                Text(
                  textAlign: TextAlign.center,
                  "The password should have at least\n6 characters.",style: TextStyle(
                    fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xff8E8EA9),),
                ),


                SizedBox(height: 80.h),
                AppInput(
                  labelText: "New password",
                  isPassword: true,

                ),
                AppInput(
                  labelText:"Confirm password" ,
                  bottomSpace: 71.h,
                  isPassword: true
                  ,
                ),

                AppButton(buttonTitle: "Confirm",onPressed: (){
                  showDialog(context: context, builder: (context)=>DialogePage(isCreatePassword: true,));
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
