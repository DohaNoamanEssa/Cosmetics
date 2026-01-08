import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {

 const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final list = [
    _Model (
      image:
          "https://avatars.mds.yandex.net/i?id=f3d13692d9d016ce970e112c39fdc339a9c0b26deb0995ae-12658945-images-thumbs&n=13",
      name: 'Bundles',
    ),

    _Model (
      name: "Perfumes",
      image:
          "https://i.pinimg.com/550x/df/c2/b4/dfc2b4965f7657f2bc9ec74acb11a6c7.jpg",
    ),
    _Model (
      name: "MakeUp",
      image: "https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg",
    ),
    _Model (
      name: "SkinCare",
      image:
          "https://img.joomcdn.net/b6b840444d1855c52c6fb104b4cbb1a6ffab8df7_original.jpeg",
    ),
    _Model (
      name: "Gifts",
      image:
          "https://i.pinimg.com/736x/5a/2a/51/5a2a518ec2620e980e24a0593b3d6754.jpg",
    ),
  ];

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
              itemBuilder: (context, index) => _Item(model: list[index]),
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
  final _Model  model;

  const _Item({ required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: AppImage(
            image: model.image,
            height: 69.h,
            width: 64.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          model.name,
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

class _Model {
  final String image;
  final String name;

  const _Model ({required this.image, required this.name});
}
