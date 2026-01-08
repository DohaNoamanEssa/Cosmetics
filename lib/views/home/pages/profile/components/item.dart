part of '../view.dart';

class _Item extends StatelessWidget {
  // final image=title.toLowerCase().replaceAll(" ", "_")+".svg";
  final String icon,title;
  final bool withSuffixIcon;

  const _Item({
    required this.icon,
    required this.title,
    this.withSuffixIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 34.h),
      child: Row(
        children: [
          AppImage(
            image: icon,
            bottomSpace: 0,
            color:  Color(withSuffixIcon ?0xff434C6D:0XFFCD0F0F),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              color: Color( withSuffixIcon ?0xff434C6D:0XFFCD0F0F),
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),

          Spacer(),
          if (withSuffixIcon)
            AppImage(image: "arrow_right.svg", color: Color(0xff434C6D)),
        ],
      ),
    );
  }
}
