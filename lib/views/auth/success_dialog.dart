import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogePage extends StatefulWidget {
  final bool isCreatePassword;

  const DialogePage({super.key, this.isCreatePassword = false});

  @override
  State<DialogePage> createState() => _DialogePageState();
}

class _DialogePageState extends State<DialogePage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffD9D9D9),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.all(8.0.r),
        width: 360.w,
        height: 343.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              imageURL: "checked_dialog.json",
              width: 70.w,
              height: 70.h,
              bottomSpace: 26.h,
            ),
            Text(
              widget.isCreatePassword ? "  Password Created!" : "Account Activated!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff434C6D),
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),

            Text(
              widget.isCreatePassword
                  ? 'Congratulations! Your password\n has been successfully created'
                  : 'Congratulations! Your account\nhas been successfully activated',
              style: TextStyle(
                color: Color(0xff8E8EA9),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20.h),
            AppButton(
              buttonTitle: widget.isCreatePassword ? "Return to login" : "Go to home",
              onPressed: () {
                if(widget.isCreatePassword){
                  goTo(LoginView());
                }
                else{
                  goTo(HomeView());
                }
                setState(() {

                });

              },




            ),
          ],
        ),
      ),
    );
  }
}
