import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late int myValue;
  final list = [20, 966, 967];

  @override
  void initState() {
    super.initState();
    myValue = list.first;
  }
  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 6.0.w,),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff5A6690).withValues(alpha: .4),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(

                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                value: myValue,
                items: list
                    .map(
                      (e) =>
                      DropdownMenuItem(
                        value: e,
                        child: Text('+$e ',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434C6D),
                        ),),
                      ),
                )
                    .toList(),
                onChanged: (value) {
                  myValue = value!;
                  setState(() {});
                },
                icon: AppImage(
                  imageURL: "arrow_down.svg",
                  color: Color(0xff767676),
                  width: 8.w,
                  height: 6.h,
                  fit: BoxFit.fill,

                ),
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 6.w,),

      ],
    );
  }
}
