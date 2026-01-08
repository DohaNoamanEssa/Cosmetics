import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final list = [
    _Model(
      image: "https://cdn1.ozone.ru/s3/multimedia-1-l/7584793473.jpg",
      title: "Note Cosmetics",
      subTitle: "Ultra rich mascara for lashes",
      price: 350,
    ),
    _Model(
      image:
          "https://productimages.hepsiburada.net/s/343/424-600/110000350476352.jpg",
      title: "ARTDECO",
      subTitle: "Bronzer - 02 ",
      price: 490,
    ),
    _Model(
      image:
          "https://i.pinimg.com/originals/93/a8/a1/93a8a110bb56b39c4661449108b9fd17.jpg",
      title: "Fendi",
      subTitle: "Lipstick - shade 9 ",
      price: 260,
    ),
    _Model(
      image:
          "https://i.pinimg.com/474x/61/00/d3/6100d31ee86ed020b101b2c77eb3a2d9.jpg",
      title: "Channel",
      subTitle: "L’eau de perfum N5 ",
      price: 15.000,
    ),
  ];

  late final numberOfProducts = list.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart", style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: IconButton(
              onPressed: () {
                goTo(CheckOutView(), canPop: true);
              },
              icon: AppImage(image: "my_cart_final.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You have $numberOfProducts products in your cart",
              style: TextStyle(
                color: Color(0XFF434C6D).withValues(alpha: .55),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 34.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: 34.h,
                ).copyWith(top: 12.h, bottom: 60.h),
                itemBuilder: (context, index) => _Item(model: list[index]),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: Divider(
                    color: Color(0xffB3B3C1).withValues(alpha: .5),
                  ),
                ),
                itemCount: list.length,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final _Model model;

  const _Item({required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Stack(
            children: [
              AppImage(
                image: widget.model.image,
                fit: BoxFit.fill,
                height: 102.h,
                width: 102.w,
                bottomSpace: 0,
              ),
              Padding(
                padding: EdgeInsets.all(6.0.r),
                child: AppImage(image: "remove.svg"),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xff3B4569),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                  children: [
                    TextSpan(text: "${widget.model.title}\n"),
                    TextSpan(
                      text: "${widget.model.subTitle}\n",
                      style: TextStyle(
                        color: Color(0xff3B4569).withValues(alpha: .73),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    TextSpan(text: "${widget.model.price.toString()} EGP"),
                  ],
                ),
              ),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xff8E8EA9), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (count > 1) {
                            count--;
                          }
                          setState(() {});
                        },
                        icon: AppImage(
                          color: Color(0XFF434C6D),
                          image: "minus.svg",
                          width: 20.w,
                          bottomSpace: 0,
                        ),
                      ),
                      Text(
                        "$count",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF434C6D),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          count++;
                          setState(() {});
                        },
                        icon: AppImage(
                          image: "plus.svg",
                          width: 20.w,
                          color: Color(0xff434C6D),
                          bottomSpace: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Model {
  final String image;
  final String title;
  final String subTitle;
  final double price;

  _Model({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });
}
