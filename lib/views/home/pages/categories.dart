import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatelessWidget {
  final list = [
    CategoriesTypes(
      imgURL:
          "https://avatars.mds.yandex.net/i?id=f3d13692d9d016ce970e112c39fdc339a9c0b26deb0995ae-12658945-images-thumbs&n=13",
      categoryTypeName: 'Bundles',
    ),

    CategoriesTypes(
      categoryTypeName: "Perfumes",
      imgURL:
          "https://i.pinimg.com/550x/df/c2/b4/dfc2b4965f7657f2bc9ec74acb11a6c7.jpg",
    ),
    CategoriesTypes(
      categoryTypeName: "MakeUp",
      imgURL: "https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg",
    ),
    CategoriesTypes(
      categoryTypeName: "SkinCare",
      imgURL:
          "https://img.joomcdn.net/b6b840444d1855c52c6fb104b4cbb1a6ffab8df7_original.jpeg",
    ),
    CategoriesTypes(
      categoryTypeName: "Gifts",
      imgURL:
          "https://i.pinimg.com/736x/5a/2a/51/5a2a518ec2620e980e24a0593b3d6754.jpg",
    ),
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),centerTitle: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13.r).copyWith(top: 24.h),
        child: Column(
          children: [
            AppSearch(),
            ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
                vertical: 30.h,
              ).copyWith(bottom: 50.h),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _Item(categoryType: list[index]),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Divider(color: Color(0xffB3B3C1).withValues(alpha: .5),),
              ),
              itemCount: list.length,
            ),
            SizedBox(height: 31.h),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoriesTypes categoryType;

  const _Item({ required this.categoryType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: AppImage(
            imageURL: categoryType.imgURL,
            height: 69.h,
            width: 64.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          categoryType.categoryTypeName,
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        AppImage(imageURL: "arrow_right.svg"),
      ],
    );
  }
}

class CategoriesTypes {
  final String imgURL;
  final String categoryTypeName;

  const CategoriesTypes({required this.imgURL, required this.categoryTypeName});
}
