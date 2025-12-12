import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';


class SplashView extends StatefulWidget {
   const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    goTo(OnBoardingView(), delayInSeconds: 2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Jello(child: AppImage(imageURL: "logo.png",width: 200.w,height: 200.h,bottomSpace: 16.h,)),
            AppImage(imageURL: "splash_txt.png",width: 120.w,height: 46.h,),
          ],
        ),
      ),
    );
  }
}