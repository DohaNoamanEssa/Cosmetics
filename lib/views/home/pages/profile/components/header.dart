part of '../view.dart';
class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 235.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff434C6D).withValues(alpha: .83),
                  Color(0xffECA4C5),
                ],
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
                AppImage(
                  height: 96.h,
                  width: 96.w,
                  isCircle: true,
                  image:
                  "https://astrologyonline.net/img/dreams/994/7-symbolic-interpretations-dreams-about-hair_10.jpg",
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
    );
  }
}