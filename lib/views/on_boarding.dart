import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardindViewState();
}

class _OnBoardindViewState extends State<OnBoardingView> {
  final list = [
    _Model(
      imgURL: "on_boarding1.png",
      title: "WELCOME!",
      subTitle:
          "Makeup has the power to transform your\n mood and empowers you to be a more\n confident person.",
    ),

    _Model(
      imgURL: "on_boarding2.png",
      title: "SEARCH & PICK",
      subTitle:
          "We have dedicated set of products and\n routines hand picked for every skin type.\n",
    ),
    _Model(
      imgURL: "on_boarding3.png",
      title: "PUCH NOTIFICATIONS ",
      subTitle: "Allow notifications for new makeup &\n cosmetics offers.\n",
    ),
  ];
  int currentIndex = 0;
  int lastIndex=2;

  @override
  Widget build(BuildContext context) {
    bool isLast =currentIndex == list.length-1;
    final currentItem=list[currentIndex];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(20.0.r),
            child: (!isLast)
                ? InkWell(
                    onTap: () => goTo(LoginView()),
                    child: Text(
                      "skip",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff434C6D),
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 78.h),
            AppImage(
              imageURL: currentItem.imgURL,
              bottomSpace: 28.h,
            ),
            Text(
              currentItem.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: Color(0xff434C6D),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              currentItem.subTitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Color(0xff434C6D),
              ),
            ),

            SizedBox(height: 30.h),
            (isLast)
                ? AppButton(
              buttonTitle: "let’s start!",
              buttonColor: Color(0xff434C6D),
              onPressed: ()=>goTo(LoginView()),
            )

                :   FloatingActionButton(
          onPressed: () {
            if (currentIndex < list.length) {
            currentIndex++;
            }
            setState(() {});
            },
              backgroundColor: Color(0xff434C6D),
              child: AppImage(
        imageURL: "arrow_right_splash.svg",
        width: 8.w,
        height: 18.h,
        color: Color(0xffD9D9D9),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _Model {
  final String imgURL;
  final String title;
  final String subTitle;

  _Model({
    required this.imgURL,
    required this.title,
    required this.subTitle,
  });
}
