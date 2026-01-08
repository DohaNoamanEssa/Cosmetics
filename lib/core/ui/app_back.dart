import 'dart:math';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBack extends StatelessWidget {
  final double paddingStart;
  const AppBack( {super.key,this.paddingStart=0,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingStart),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Transform.rotate(
            angle: pi,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Color(0XFF101010).withValues(alpha: .05),
              child: AppImage(
                image: "arrow_right_splash.svg",
                color: Color(0XFF101010),
                width: 21.w,
                height: 21.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
