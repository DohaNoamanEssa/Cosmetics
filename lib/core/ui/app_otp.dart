import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerifyCode extends StatelessWidget {
  const AppVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: Color(0xff101010).withValues(alpha: .22),
      cursorHeight: 16.h,
      cursorWidth: 5.w,
      hintCharacter: "_",
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (builder, context) => SizedBox(width: 12.w),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.0.r),
        activeColor: Color(0XFFD75D72),
        selectedColor: Color(0XFFD75D72),
        inactiveColor: Color(0XFF898992).withValues(alpha: .36),
      ),
    );
  }
}
