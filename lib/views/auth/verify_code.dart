import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_otp.dart';
import 'package:cosmetics/core/ui/app_resend_otp.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_back.dart';

class VerifyCodePage extends StatefulWidget {
  final bool isForgetPassword;

  const VerifyCodePage({super.key, this.isForgetPassword = false});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  _VerifyCodePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.0.r),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBack(),
              SizedBox(height: 40.h,),
              AppImage(
                imageURL: "logo.png",
                height: 62.h,
                width: 67.w,
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
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        '+20 1022658997',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          height: 2.4.h,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xff434C6D),
                        ),
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
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit the number",
                    style: TextStyle(
                      color: Color(0xffD75D72),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.h),

              AppVerifyCode(),
              SizedBox(height: 58.h),
             AppResendOTP(),

              SizedBox(height: 113.h),
              AppButton(
                buttonTitle: "Done",
                onPressed: () {
                  setState(() {
                    if (widget.isForgetPassword == true) {
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
    );
  }
}
