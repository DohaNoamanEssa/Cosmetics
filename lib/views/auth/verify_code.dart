import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodePage extends StatefulWidget {
  final bool isForgetPassword;
  const VerifyCodePage({super.key, required this.isForgetPassword});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState(forgetPassword:isForgetPassword);
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final bool forgetPassword;

  _VerifyCodePageState({ required this.forgetPassword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(13.0.r),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppImage(
                  imageURL: "logo.png",
                  height: 62.h,
                  width: 67.w,
                  topSpace: 40.h,
                  bottomSpace: 40.h,
                ),
                Text(
                  "Verify Code",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 40.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8E8EA9),
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'We just sent a 4-digit verification code to\n',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff8E8EA9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '+20 1022658997',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      TextSpan(
                        text:
                            '. Enter the code in the box\n below to continue.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xff8E8EA9),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Edit the number",
                    style: TextStyle(
                      color: Color(0xffD75D72),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "-",
                          hintStyle: TextStyle(
                            color: Color(0xff8E8EA9),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD75D72)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff898992).withValues(alpha: .36),
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 58.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Didn’t receive a code?",
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: Color(0xffD75D72).withValues(alpha: .54),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "0:36",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8E8EA9),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 113.h),
                AppButton(
                  buttonTitle: "Done",
                  onPressed: () {


                    setState(() {

                      if (forgetPassword==true) {
                        goTo(CreatePasswordView());


                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => DialogePage(),
                        );
                      }
                    });
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
