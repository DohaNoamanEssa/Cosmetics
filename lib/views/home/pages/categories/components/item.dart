part of '../view.dart';

class _Item extends StatelessWidget {
  final CategoryModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: AppImage(
            image: model.imageUrl,
            height: 69.h,
            width: 64.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          model.title,
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        AppImage(image: "arrow_right.svg"),
      ],
    );
  }
}
