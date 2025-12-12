import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoriesDetails> categoriesList = [
    CategoriesDetails(
      "https://i.pinimg.com/originals/11/f5/22/11f522c7f8ead5519a4b102723f0a89c.jpg",
      "Face tint / lip tint",
      "44.99",
    ),
    CategoriesDetails(
      "https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg",
      "Athe Red lipstick",
      "44.99",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearch(),

              SizedBox(height: 13.h),

              //Stack ----------------------------------------------------------------------------
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      imageURL:
                          "https://img.buzzfeed.com/buzzfeed-static/static/2019-08/16/2/asset/2f2486d35771/sub-buzz-2247-1565922471-1.jpg",

                      height: 320.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 364.w,
                      padding: EdgeInsets.all(16.r),
                      color: Color(0XFFE9DCD3).withValues(alpha: .8),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50% OFF DISCOUNT\nCUPON CODE : 125865",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFF62322D),
                                  ),
                                ),
                              ),
                              AppImage(imageURL: "discount.svg"),
                            ],
                          ),
                          Row(
                            children: [
                              AppImage(imageURL: "discount.svg"),
                              Spacer(),
                              Text(
                                "Hurry up!\nSkin care only !",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF434C6D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              //Text-----------------------------------------------------------------------------
              Text(
                "Top rated products",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF434C6D),
                ),
              ),
              SizedBox(height: 14.h),
              //Products---------------------------------------------------------------------------
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 176 / 237,
                ),
                itemBuilder: (context, index) =>
                    _Item(category: categoriesList[index]),
                itemCount: categoriesList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoriesDetails category;

  const _Item({required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8.0.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0,
                blurStyle: BlurStyle.inner,
                color: Colors.black.withValues(alpha: .25),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AppImage(
                    imageURL: category.catImgURL,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                category.catTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                "\$ ${category.catPrice}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff70839C),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.all(12.0.r),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: AppImage(imageURL: "check_out.svg"),
          ),
        ),
      ],
    );
  }
}

class CategoriesDetails {
  final String catImgURL;
  final String catTitle;
  final String catPrice;

  CategoriesDetails(this.catImgURL, this.catTitle, this.catPrice);
}
