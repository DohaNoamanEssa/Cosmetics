import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResendOTP extends StatefulWidget {
  const AppResendOTP({super.key});

  @override
  State<AppResendOTP> createState() => _AppResendOTPState();
}

class _AppResendOTPState extends State<AppResendOTP> {
  bool isSent=true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
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
            onPressed: isSent? null: () {
              isSent=true;
              setState(() {

              });
            },
            child: Text(
              "Resend",
              style: TextStyle(
                color: isSent? Colors.yellowAccent.shade100:Color(0xffD75D72).withValues(alpha: .54),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          if(isSent)
          CircularCountDownTimer(
            width: 50,
            height: 40,
            duration: 5,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
            isReverse: true,
            textFormat: CountdownTextFormat.MM_SS,
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff8E8EA9),
              fontSize: 12.sp,
            ),
            onComplete: (){
              isSent=false;
              setState(() {

              });
            },
          ),

        ],
      ),
    );
  }
}
