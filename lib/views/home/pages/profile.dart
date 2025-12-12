import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final gradientColors = [Color(0xff434C6D).withValues(alpha: .83), Color(0xffECA4C5)];
  final list = [
    ProfileDetails(iconName: "edit_info.svg", title: "Edit Info"),
    ProfileDetails(iconName: "order_history.svg", title: "Order History"),
    ProfileDetails(iconName: "wallet.svg", title: "Wallet"),
    ProfileDetails(iconName: "settings.svg", title: "Settings"),
    ProfileDetails(iconName: "offer.svg", title: "Voucher"),
    ProfileDetails(iconName: "logout.svg", title: "Logout",withSuffixIcon: false,),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 235.h,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 152.h,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: AppImage(
                            bottomSpace: 0,
                            height: 96.h,
                            width: 96.w,
                            imageURL:
                                "https://astrologyonline.net/img/dreams/994/7-symbolic-interpretations-dreams-about-hair_10.jpg",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Sara Samer Talaat",
                          style: TextStyle(
                            color: Color(0xFF434c6D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:40.h),
            Padding(
              padding:  EdgeInsets.all(13.0.r),
              child: Column(
                children: [
                  ...list,
                  SizedBox(height: 34.h),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileDetails extends StatelessWidget {
  final String iconName;
 final String title;
 final Color? color;
 final bool withSuffixIcon;

   const ProfileDetails({super.key, required this.iconName, required this.title,  this.color, this.withSuffixIcon=true});

  @override
  Widget build(BuildContext context) {
    return myProfileDetails();
  }

  Widget myProfileDetails() {
    return Column(
      children: [
        SizedBox(height: 34.h,),
        Row(
          children: [
            AppImage(imageURL: iconName,bottomSpace: 0,
              color: withSuffixIcon?Color(0xff434C6D):Color(0XFFCD0F0F),),
            SizedBox(width: 8.w,),
            Text(
              title,
              style: TextStyle(
                color:withSuffixIcon? Color(0xff434C6D):Color(0XFFCD0F0F),
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),

            Spacer(),
            withSuffixIcon?
            AppImage(imageURL: "arrow_right.svg",color: Color(0xff434C6D),):Text(""),


          ],
        ),

      ],
    );
  }
}

